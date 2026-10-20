output "iam_server_certificat_arn" {
  description = "ARN specifying the server certificate"
  value       = element(concat(aws_iam_server_certificate.iam_server_certificate.*.arn, [""]), 0)
}
output "iam_server_certificat_expiration" {
  description = "Date and time in RFC3339 format on which the certificate is set to expire"
  value       = element(concat(aws_iam_server_certificate.iam_server_certificate.*.expiration, [""]), 0)
}
output "iam_server_certificat_id" {
  description = "The unique Server Certificate name"
  value       = element(concat(aws_iam_server_certificate.iam_server_certificate.*.id, [""]), 0)
}
output "iam_server_certificat_upload_date" {
  description = "Date and time in RFC3339 format when the server certificate was uploaded"
  value       = element(concat(aws_iam_server_certificate.iam_server_certificate.*.upload_date, [""]), 0)
}
