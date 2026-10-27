output "acmpca_certificate_authority_arn" {
  description = "ARN of the certificate authority"
  value       = element(concat(aws_acmpca_certificate_authority.acmpca_certificate_authority.*.arn, [""]), 0)
}
output "acmpca_certificate_authority_id" {
  description = "ARN of the certificate authority"
  value       = element(concat(aws_acmpca_certificate_authority.acmpca_certificate_authority.*.id, [""]), 0)
}
output "acmpca_certificate_authority_certificate" {
  description = "Base64-encoded certificate authority (CA) certificate. Only available after the certificate authority certificate has been imported"
  value       = element(concat(aws_acmpca_certificate_authority.acmpca_certificate_authority.*.certificate, [""]), 0)
}
output "acmpca_certificate_authority_certificate_chain" {
  description = "Base64-encoded certificate chain that includes any intermediate certificates and chains up to root on-premises certificate that you used to sign your private CA certificate. The chain does not include your private CA certificate. Only available after the certificate authority certificate has been imported"
  value       = element(concat(aws_acmpca_certificate_authority.acmpca_certificate_authority.*.certificate_chain, [""]), 0)
}
output "acmpca_certificate_authority_certificate_signing_request" {
  description = "The base64 PEM-encoded certificate signing request (CSR) for your private CA certificate"
  value       = element(concat(aws_acmpca_certificate_authority.acmpca_certificate_authority.*.certificate_signing_request, [""]), 0)
}
output "acmpca_certificate_authority_not_after" {
  description = "Date and time after which the certificate authority is not valid. Only available after the certificate authority certificate has been imported"
  value       = element(concat(aws_acmpca_certificate_authority.acmpca_certificate_authority.*.not_after, [""]), 0)
}
output "acmpca_certificate_authority_not_before" {
  description = "Date and time before which the certificate authority is not valid. Only available after the certificate authority certificate has been imported"
  value       = element(concat(aws_acmpca_certificate_authority.acmpca_certificate_authority.*.not_before, [""]), 0)
}
output "acmpca_certificate_authority_serial" {
  description = "Serial number of the certificate authority. Only available after the certificate authority certificate has been imported"
  value       = element(concat(aws_acmpca_certificate_authority.acmpca_certificate_authority.*.serial, [""]), 0)
}
