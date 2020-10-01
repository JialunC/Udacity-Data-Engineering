output "redshift_dns_name" {
  description = "The DNS name of the cluster"
  value       = module.data_warehousing.redshift_dns_name
}

output "redshift_data_warehouse_role_arn" {
  description = "The ARN id of resulting role"
  value       = module.data_warehousing.redshift_data_warehouse_role_arn
}