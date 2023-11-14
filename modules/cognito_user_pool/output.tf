output "cognito_user_pool_arn" {
  description = "User pool ARN"
  value       = element(concat(aws_cognito_user_pool.cognito_user_pool.*.arn, [""]), 0)
}
output "cognito_user_pool_creation_date" {
  description = "Date the user pool was created"
  value       = element(concat(aws_cognito_user_pool.cognito_user_pool.*.creation_date, [""]), 0)
}
output "cognito_user_pool_custom_domain" {
  description = "A custom domain name that you provide to Amazon Cognito. This parameter applies only if you use a custom domain to host the sign-up and sign-in pages for your application. For example: auth.example.com"
  value       = element(concat(aws_cognito_user_pool.cognito_user_pool.*.custom_domain, [""]), 0)
}
output "cognito_user_pool_domain" {
  description = "Holds the domain prefix if the user pool has a domain associated with it"
  value       = element(concat(aws_cognito_user_pool.cognito_user_pool.*.domain, [""]), 0)
}
output "cognito_user_pool_endpoint" {
  description = "Endpoint name of the user pool. Example format: cognito-idp.REGION.amazonaws.com/xxxx_yyyyy"
  value       = element(concat(aws_cognito_user_pool.cognito_user_pool.*.endpoint, [""]), 0)
}
output "cognito_user_pool_estimated_number_of_users" {
  description = "A number estimating the size of the user pool"
  value       = element(concat(aws_cognito_user_pool.cognito_user_pool.*.estimated_number_of_users, [""]), 0)
}
output "cognito_user_pool_id" {
  description = "User pool ID"
  value       = element(concat(aws_cognito_user_pool.cognito_user_pool.*.id, [""]), 0)
}
output "cognito_user_pool_last_modified_date" {
  description = "Date the user pool was last modified"
  value       = element(concat(aws_cognito_user_pool.cognito_user_pool.*.last_modified_date, [""]), 0)
}
