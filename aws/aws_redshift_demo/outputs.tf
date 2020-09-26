output "redshift_dns_name" {
  description = "The DNS name of the cluster"
  value       = module.data_warehousing.redshift_dns_name
}