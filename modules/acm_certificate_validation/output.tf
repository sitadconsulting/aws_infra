output "acm_certificate_validation_id" {
  description = "Time at which the certificate was issued"
  value       = element(concat(aws_acm_certificate_validation.acm_certificate_validation.*.id, [""]), 0)
}
