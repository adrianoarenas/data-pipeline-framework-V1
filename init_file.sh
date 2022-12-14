#! /bin/bash

#Install Docker
echo "Installing Docker"
yes | sudo yum install docker
sudo service docker start
sudo usermod -a -G docker ec2-user

#Docker compose
echo "Installing Docker Compose"
sudo curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "changing directory to docker dir"
cd /home/ec2-user/data-pipeline-framework-V1/

echo "creating folders"
sudo mkdir -p ./dags/dags ./logs ./plugins

echo "creating env var"
sudo echo -e "AIRFLOW_UID=$(id -u)" > .env

sudo gpasswd -a $USER docker
newgrp docker

echo "after setting docker user"
docker-compose up -d

echo "giving ec2-user folder permission to update dags"
sudo chown ec2-user:ec2-user ./dags/
sudo chown ec2-user:ec2-user ./dags/dags