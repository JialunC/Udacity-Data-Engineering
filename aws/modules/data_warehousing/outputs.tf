output "redshift_dns_name" {
  description = "The DNS name of the cluster"
  value       = module.redshift.redshift_dns_name
}