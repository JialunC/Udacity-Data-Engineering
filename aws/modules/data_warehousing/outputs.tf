output "redshift_dns_name" {
  description = "The DNS name of the cluster"
  value       = module.redshift.redshift_dns_name
}

output "redshift_data_warehouse_role_arn" {
  description = "The ARN id of resulting role"
  value       = aws_iam_role.redshift_data_warehouse_role.arn
}