# Data Pipeline Framwork
In this repo we are building a simple ELT framework suitable for small datasets.

This framework is composed by:
- A slighty lighter version of **Airflow** for scheduling [(Referenced from the Data Talks Data Engineering Zoomcamp)](https://github.com/DataTalksClub/data-engineering-zoomcamp/tree/main/week_2_data_ingestion).
- **AWS S3** to load the raw files collected.
- **PostgreSQL** database to load data, perform transformations and data warehouse.

This architecture is not really suitable to scale data projects as the data extraction and processing scripts are all run in the same EC2 instance airflow is hosted in.  Trying to scale this up would most probably lead to one of two options:
- Run the bigger data scripts and transformations in this same instance with the risk of crashing it in case something goes wrong or we run out of memory.
- Host this framework on a larger EC2 instance which would increase cost.

![Architecture Diagram](https://user-images.githubusercontent.com/24966827/211121309-5baf7506-27f9-4e25-a469-1bcc2ef3bb81.png)


Steps to deploy:
1. [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) and set up AWS credentials.
2. Clone this repo and cd to *./Terraform directory*.
3. Create a file called variables.tf - for privacy reasons I've added this file to my *.gitignore*.  It should look like this:

![terrafomr vars](https://user-images.githubusercontent.com/24966827/211122034-fbcfedc6-da2c-4f12-9e8a-ecbdb7a8417a.png)

  - For the ssh key name, create the key in AWS or make sure you upload/setup your keypair in AWS with the same name set in the *variables.tf* file.

4. Execute **Terraform apply**, this will create the following resources:
  - AWS bucket for your raw/collected files.
  - Security group with the proper ports to ssh into your EC2 instance and log into the Airflow Web Server.
  - Create a Role for your EC2 instance to connect to the AWS Secrets Manager.
  - Launch an EC2 instance that will bootstrap with the following steps:
    1. Clone this repo
    2. Execute [init.sh](https://github.com/adrianoarenas/data-pipeline-framework-V1/blob/main/init_file.sh)
    3. Install Docker and Docker Compose
    4. Create the folders for the Airflow dags, plugins and logs.
    5. Change the folder permissions so that Github Actions in [this](https://github.com/adrianoarenas/datasets-framework-V1) repo can add, update or remove dags and processing scripts.



<br/><br/><br/><br/>

**Currently updating this folder**!
