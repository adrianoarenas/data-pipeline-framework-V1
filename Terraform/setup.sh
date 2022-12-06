#! /bin/bash

echo "Updating packages"
yes | sudo yum update

echo "Installing git"
yes | sudo yum install git

echo "Cloning Repo for DAGs, etc"
echo "Cloning Repo"
sudo git clone https://github.com/adrianoarenas/data-pipeline-framework-V1.git /home/ec2-user/data-pipeline-framework-V1

echo "Executing /init_file.sh"
sudo chmod 777 /home/ec2-user/data-pipeline-framework-V1/init_file.sh
/home/ec2-user/data-pipeline-framework-V1/init_file.sh