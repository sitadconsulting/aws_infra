output "cognito_managed_user_pool_client_client_secret" {
  description = "Client secret of the user pool client"
  value       = element(concat(aws_cognito_managed_user_pool_client.cognito_managed_user_pool_client.*.client_secret, [""]), 0)
}
output "cognito_managed_user_pool_client_id" {
  description = "Unique identifier for the user pool client"
  value       = element(concat(aws_cognito_managed_user_pool_client.cognito_managed_user_pool_client.*.id, [""]), 0)
}
output "cognito_managed_user_pool_client_name" {
  description = "Name of the user pool client"
  value       = element(concat(aws_cognito_managed_user_pool_client.cognito_managed_user_pool_client.*.name, [""]), 0)
}
