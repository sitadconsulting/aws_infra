output "iam_openid_connect_provider_arn" {
  description = "The ARN assigned to this OIDC provider"
  value       = element(concat(aws_iam_openid_connect_provider.iam_openid_connect_provider.*.arn, [""]), 0)
}
