output "iot_ca_certificate_arn" {
  description = "The ARN of the created CA certificate"
  value       = element(concat(aws_iot_ca_certificate.iot_ca_certificate.*.arn, [""]), 0)
}
output "iot_ca_certificate_customer_version" {
  description = "The customer version of the CA certificate"
  value       = element(concat(aws_iot_ca_certificate.iot_ca_certificate.*.customer_version, [""]), 0)
}
output "iot_ca_certificate_generation_id" {
  description = "The generation ID of the CA certificate"
  value       = element(concat(aws_iot_ca_certificate.iot_ca_certificate.*.generation_id, [""]), 0)
}
output "iot_ca_certificate_id" {
  description = "The internal ID assigned to this CA certificate"
  value       = element(concat(aws_iot_ca_certificate.iot_ca_certificate.*.id, [""]), 0)
}
output "iot_ca_certificate_validity_not_after" {
  description = "The certificate is not valid after this date"
  value       = element(concat(aws_iot_ca_certificate.iot_ca_certificate.validity.*.not_after, [""]), 0)
}
output "iot_ca_certificate_validity_not_after" {
  description = "The certificate is not valid before this date"
  value       = element(concat(aws_iot_ca_certificate.iot_ca_certificate.validity.*.not_before, [""]), 0)
}
