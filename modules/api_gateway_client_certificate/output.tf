output "api_gateway_client_certificate_id" {
  description = "Client certificate ID"
  value       = element(concat(aws_api_gateway_client_certificate.api_gateway_client_certificate.*.id, [""]), 0)
}
output "api_gateway_client_certificate_created_date" {
  description = "Date when the client certificate was created"
  value       = element(concat(aws_api_gateway_client_certificate.api_gateway_client_certificate.*.created_date, [""]), 0)
}
output "api_gateway_client_certificate_expiration_date" {
  description = "Date when the client certificate will expire"
  value       = element(concat(aws_api_gateway_client_certificate.api_gateway_client_certificate.*.expiration_date, [""]), 0)
}
output "api_gateway_client_certificate_pem_encoded_certificate" {
  description = "The PEM-encoded public key of the client certificate"
  value       = element(concat(aws_api_gateway_client_certificate.api_gateway_client_certificate.*.pem_encoded_certificate, [""]), 0)
}
output "api_gateway_client_certificate_arn" {
  description = "Client certificate arn"
  value       = element(concat(aws_api_gateway_client_certificate.api_gateway_client_certificate.*.arn, [""]), 0)
}
