output "cognito_user_pool_client_client_secret" {
  description = "User pool client Client_Secret"
  value       = element(concat(aws_cognito_user_pool_client.cognito_user_pool_client.*.client_secret, [""]), 0)
}
output "cognito_user_pool_client_id" {
  description = "User pool client ID"
  value       = element(concat(aws_cognito_user_pool_client.cognito_user_pool_client.*.id, [""]), 0)
}
