output "acmpca_certificate_arn" {
  description = "ARN of this acmpca certificate"
  value       = element(concat(aws_acmpca_certificate.acmpca_certificate.*.arn, [""]), 0)
}
output "acmpca_certificate" {
  description = "PEM-encoded certificate value"
  value       = element(concat(aws_acmpca_certificate.acmpca_certificate.*.certificate, [""]), 0)
}
output "acmpca_certificate_chain" {
  description = "PEM-encoded certificate chain that includes any intermediate certificates and chains up to root CA"
  value       = element(concat(aws_acmpca_certificate.acmpca_certificate.*.certificate_chain, [""]), 0)
}

