provider "aws" {
  region = "us-east-2"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.44.0"
  name    = "${var.name}-vpc"
  azs = [
    "us-east-2a",
    "us-east-2b",
    "us-east-2c",
  ]
  cidr = "172.31.0.0/16"
  private_subnets = [
    "172.31.0.0/20",
    "172.31.16.0/20",
  ]
  public_subnets = [
    "172.31.48.0/20",
    "172.31.64.0/20",
  ]

  vpc_tags = {
    Name = "${var.name}-vpc"
  }
}

module "redshift_sg" {
  source              = "terraform-aws-modules/security-group/aws"
  version             = "3.11.0"
  name                = "${var.name}-redshift-sg"
  description         = "Inbound and outbound for redshift"
  vpc_id              = module.vpc.vpc_id
  ingress_rules       = ["redshift-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules        = ["all-all"]
}

resource "aws_iam_role" "redshift_data_warehouse_role" {
  name = "redshiftDataWarehouseRole"

  assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
       "Service": "redshift.amazonaws.com"
     },
     "Effect": "Allow",
     "Sid": ""
   }
 ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "redshift_data_warehouse_role-policy-attachment" {
  role       = aws_iam_role.redshift_data_warehouse_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

data "aws_secretsmanager_secret_version" "master_username" {
  secret_id = var.master_username_secret_manager_arn
}

data "aws_secretsmanager_secret_version" "master_password" {
  secret_id = var.master_password_secret_manager_arn
}

module "redshift" {
  source                 = "../redshift"
  cluster_identifier     = "${var.name}-redshift"
  database_name          = "${var.name}_redshift_db"
  master_username        = data.aws_secretsmanager_secret_version.master_username.secret_string
  master_password        = data.aws_secretsmanager_secret_version.master_password.secret_string
  iam_roles              = "${list("${aws_iam_role.redshift_data_warehouse_role.arn}", )}"
  vpc_security_group_ids = "${list("${module.redshift_sg.this_security_group_id}", )}"
  public_subnets         = module.vpc.public_subnets
}
