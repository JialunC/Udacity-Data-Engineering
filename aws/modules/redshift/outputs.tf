output "redshift_dns_name" {
  description = "The DNS name of the cluster"
  value       = aws_redshift_cluster.this.dns_name
}
