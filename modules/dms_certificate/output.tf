output "dms_certificate_arn" {
  description = "ARN for the certificate"
  value       = element(concat(aws_dms_certificate.dms_certificate.*.arn, [""]), 0)
}
