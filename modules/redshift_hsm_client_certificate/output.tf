output "redshift_hsm_client_certificate_arn" {
  description = "ARN of the Hsm Client Certificate"
  value       = element(concat(aws_redshift_hsm_client_certificate.redshift_hsm_client_certificate.*.arn, [""]), 0)
}
output "redshift_hsm_client_certificate_public_key" {
  description = "The public key that the Amazon Redshift cluster will use to connect to the HSM. You must register the public key in the HSM"
  value       = element(concat(aws_redshift_hsm_client_certificate.redshift_hsm_client_certificate.*.hsm_client_certificate_public_key, [""]), 0)
}
