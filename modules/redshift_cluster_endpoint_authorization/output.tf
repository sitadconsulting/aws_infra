output "redshift_endpoint_authorization_allowed_all_vpcs" {
  description = "Indicates whether all VPCs in the grantee account are allowed access to the cluster"
  value       = element(concat(aws_redshift_endpoint_authorization.redshift_endpoint_authorization.*.allowed_all_vpcs, [""]), 0)
}
output "redshift_endpoint_authorization_id" {
  description = "The identifier of the Redshift Endpoint Authorization, account, and cluster_identifier separated by a colon (:)"
  value       = element(concat(aws_redshift_endpoint_authorization.redshift_endpoint_authorization.*.id, [""]), 0)
}
output "redshift_endpoint_authorization_endpoint_count" {
  description = "The number of Redshift-managed VPC endpoints created for the authorization"
  value       = element(concat(aws_redshift_endpoint_authorization.redshift_endpoint_authorization.*.endpoint_count, [""]), 0)
}
output "redshift_endpoint_authorization_grantee" {
  description = "The Amazon Web Services account ID of the grantee of the cluster"
  value       = element(concat(aws_redshift_endpoint_authorization.redshift_endpoint_authorization.*.grantee, [""]), 0)
}
output "redshift_endpoint_authorization_grantor" {
  description = "The Amazon Web Services account ID of the cluster owner"
  value       = element(concat(aws_redshift_endpoint_authorization.redshift_endpoint_authorization.*.grantor, [""]), 0)
}
