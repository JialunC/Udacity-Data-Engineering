variable "cluster_identifier" {
  description = "The Cluster Identifier. Must be a lower case string."
}

variable "database_name" {
  description = "The name of the first database to be created when the cluster is created."
}

variable "master_username" {
  description = "Username for the master DB user"
}

variable "master_password" {
  description = "Password for the master DB user. Password must contain at least 8 chars and contain at least one uppercase letter, one lowercase letter, and one number."
}

variable "iam_roles" {
  description = "A list of IAM Role ARNs to associate with the cluster"
  type        = list(string)
}

variable "vpc_security_group_ids" {
  description = "A list of Virtual Private Cloud (VPC) security groups to be associated with the cluster."
  type        = list(string)
}

variable "public_subnets" {
  description = "public subnets"
  type        = list(string)
}
