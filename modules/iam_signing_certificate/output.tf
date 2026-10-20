output "iam_signing_certificate_certificate_id" {
  description = "The ID for the signing certificate"
  value       = element(concat(aws_iam_signing_certificate.iam_signing_certificate.*.certificate_id, [""]), 0)
}
output "iam_signing_certificate_id" {
  description = "The certificate_id:user_name"
  value       = element(concat(aws_iam_signing_certificate.iam_signing_certificate.*.id, [""]), 0)
}
