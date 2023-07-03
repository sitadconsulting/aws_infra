output "redshift_hsm_configuration_arn" {
  description = "ARN of the Hsm Client Certificate"
  value       = element(concat(aws_redshift_hsm_configuration.redshift_hsm_configuration.*.arn, [""]), 0)
}
output "redshift_hsm_configuration_public_key" {
  description = "The public key that the Amazon Redshift cluster will use to connect to the HSM. You must register the public key in the HSM"
  value       = element(concat(aws_redshift_hsm_configuration.redshift_hsm_configuration.*.hsm_configuration_public_key, [""]), 0)
}
