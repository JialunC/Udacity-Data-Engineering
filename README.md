# Udacity-Data-Engineering

This project is developed based on [san089/Udacity-Data-Engineering-Projects](https://github.com/san089/Udacity-Data-Engineering-Projects). 

For project 1 and 2, in order to make it easier to setup and run, I dockerize Jupyter, Postgres, Cassandra, so you can have an isolated playground environment.

For project 3, instead of using the AWS Python CLI, I use Terraform for codifying the infrastructure setup.

## To start (Project 1 & 2)

1. Download Docker if you don't have Docker intalled. You can download it at [here](https://www.docker.com/products/docker-desktop)
2. Run `docker-compose up --build`
3. To access Jupyter, open up another terminal and cd into the same directory. Run `docker-compose logs jupyter` and look for something like:
```
jupyter_1      |     To access the notebook, open this file in a browser:
jupyter_1      |         file:///home/jovyan/.local/share/jupyter/runtime/nbserver-6-open.html
jupyter_1      |     Or copy and paste one of these URLs:
jupyter_1      |         http://805700573b7d:8888/?token=787bb445bc8c2ef2cf9f9e258817619627df94de751e1e46
jupyter_1      |      or http://127.0.0.1:8888/?token=787bb445bc8c2ef2cf9f9e258817619627df94de751e1e46
```

## To start (Project 3)

1. Download Terraform from https://www.terraform.io/
2. Make sure you obtain your aws key and assign the `AdministratorAccess` (a AWS managed policy) to your IAM user.
3. Navigate to the AWS website and find the **AWS Secrets Manager** service.
4. Save your redshift username and password in Secrets Manager, get the arns.
5. Put your arn ids in the file in `/aws/aws_redshift_demo/main.tf`.
6. Run `terraform init` then `terraform plan` in the `/aws/aws_redshift_demo` folder to inspect what resources will be created.
7. Run `terraform apply` to apply those changes.

To destroy resources created from this terraform module:
1. Navigate to the AWS website and delete the redshift instance manually.
2. Run `terraform destroy` in the `/aws/aws_redshift_demo` folder.