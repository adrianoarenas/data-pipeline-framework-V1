# Data Pipeline Framwork
In this repo we are building a simple ELT framework suitable for small datasets.

This framework is composed by:
- A lightweight version of **Airflow** for scheduling.
- **AWS S3** to load the raw files collected by python scripts.
- **PostgreSQL** database to load data, perform transformations and data warehouse.

This architecture is not really suitable to scale data projects as the data extraction and processing scripts are all run in the same EC2 instance airflow is hosted in.  Trying to scale this up would most probably lead to one of two options:
- Run the bigger data scripts and transformations in this same instance with the risk of crashing it in case something goes wrong or we run out of memory.
- Host this framework on a larger EC2 instance which would increase cost.


[frameworkv11 drawio](https://user-images.githubusercontent.com/24966827/211121156-6076c46a-257c-466d-88db-16119d26a62e.png)


**Currently updating this folder**!
