output "redshift_endpoint_access_address" {
  description = "The DNS address of the endpoint"
  value       = element(concat(aws_redshift_endpoint_access.redshift_endpoint_access.*.address, [""]), 0)
}
output "redshift_endpoint_access_id" {
  description = "The Redshift-managed VPC endpoint name"
  value       = element(concat(aws_redshift_endpoint_access.redshift_endpoint_access.*.id, [""]), 0)
}
output "redshift_endpoint_access_port" {
  description = "The port number on which the cluster accepts incoming connections"
  value       = element(concat(aws_redshift_endpoint_access.redshift_endpoint_access.*.port, [""]), 0)
}
output "redshift_endpoint_access_vpc_endpoint" {
  description = "The connection endpoint for connecting to an Amazon Redshift cluster through the proxy"
  value       = element(concat(aws_redshift_endpoint_access.redshift_endpoint_access.*.vpc_endpoint, [""]), 0)
}
