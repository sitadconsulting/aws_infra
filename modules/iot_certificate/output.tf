output "iot_certificate_arn" {
  description = "The ARN of the created certificate"
  value       = element(concat(aws_iot_certificate.iot_certificate.*.arn, [""]), 0)
}
output "iot_certificate_ca_certificate_id" {
  description = "The certificate ID of the CA certificate used to sign the certificate"
  value       = element(concat(aws_iot_certificate.iot_certificate.*.ca_certificate_id, [""]), 0)
}
output "iot_certificate_certificate_pem" {
  description = "The certificate ID of the CA certificate used to sign the certificate"
  value       = element(concat(aws_iot_certificate.iot_certificate.*.certificate_pem, [""]), 0)
}
output "iot_certificate_id" {
  description = "The internal ID assigned to this certificate"
  value       = element(concat(aws_iot_certificate.iot_certificate.*.id, [""]), 0)
}
output "iot_certificate_public_key" {
  description = "When neither CSR nor certificate is provided, the public key"
  value       = element(concat(aws_iot_certificate.iot_certificate.*.public_key, [""]), 0)
}
output "iot_certificate_private_key" {
  description = "When neither CSR nor certificate is provided, the private key"
  value       = element(concat(aws_iot_certificate.iot_certificate.*.private_key, [""]), 0)
}
