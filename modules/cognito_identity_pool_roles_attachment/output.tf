output "cognito_identity_pool_roles_attachment_id" {
  description = "The identity pool ID"
  value       = element(concat(aws_cognito_identity_pool_roles_attachment.cognito_identity_pool_roles_attachment.*.id, [""]), 0)
}
