# Data Pipeline Framwork
In this repo we are building a simple ELT framework suitable for small datasets.

This framework is composed by:
- A lightweight version of **Airflow** for scheduling.
- **AWS S3** to load the raw files collected.
- **PostgreSQL** database to load data, perform transformations and data warehouse.

This architecture is not really suitable to scale data projects as the data extraction and processing scripts are all run in the same EC2 instance airflow is hosted in.  Trying to scale this up would most probably lead to one of two options:
- Run the bigger data scripts and transformations in this same instance with the risk of crashing it in case something goes wrong or we run out of memory.
- Host this framework on a larger EC2 instance which would increase cost.

![Architecture Diagram](https://user-images.githubusercontent.com/24966827/211121309-5baf7506-27f9-4e25-a469-1bcc2ef3bb81.png)




**Currently updating this folder**!
