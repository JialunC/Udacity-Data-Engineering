resource "aws_redshift_subnet_group" "this" {
  name = "${var.cluster_identifier}-subnet"
  subnet_ids = var.public_subnets
}

resource "aws_redshift_cluster" "this" {
  cluster_identifier        = var.cluster_identifier
  database_name             = var.database_name
  master_username           = var.master_username
  master_password           = var.master_password
  node_type                 = "dc2.large"
  cluster_type              = "single-node"
  iam_roles                 = var.iam_roles
  vpc_security_group_ids    = var.vpc_security_group_ids
  cluster_subnet_group_name = aws_redshift_subnet_group.this.id
  skip_final_snapshot = true
}
