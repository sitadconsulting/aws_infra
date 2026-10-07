output "ssoadmin_trusted_token_issuer_arn" {
  description = "ARN of the trusted token issuer"
  value       = element(concat(aws_ssoadmin_trusted_token_issuer.ssoadmin_trusted_token_issuer.*.arn, [""]), 0)
}
