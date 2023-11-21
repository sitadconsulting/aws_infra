output "sagemaker_workforce_arn" {
  description = "ARN assigned by AWS to this Workforce"
  value       = element(concat(aws_sagemaker_workforce.sagemaker_workforce.*.arn, [""]), 0)
}
output "sagemaker_workforce_id" {
  description = "Workforce ID"
  value       = element(concat(aws_sagemaker_workforce.sagemaker_workforce.*.id, [""]), 0)
}
output "sagemaker_workforce_subdomain" {
  description = "OIDC Identity Provider subdomain"
  value       = element(concat(aws_sagemaker_workforce.sagemaker_workforce.*.subdomain, [""]), 0)
}
output "sagemaker_workforce_workforce_vpc_config_vpc_endpoint_id" {
  description = "The IDs for the VPC service endpoints of your VPC workforce"
  value       = element(concat(aws_sagemaker_workforce.sagemaker_workforce.workforce_vpc_config.*.vpc_endpoint_id, [""]), 0)
}
