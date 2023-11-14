output "cognito_identity_pool_id" {
  description = "An identity pool ID, e.g. us-west-2:1a234567-8901-234b-5cde-f6789g01h2i3"
  value       = element(concat(aws_cognito_identity_pool.cognito_identity_pool.*.id, [""]), 0)
}
output "cognito_identity_pool_arn" {
  description = "Identity pool ARN"
  value       = element(concat(aws_cognito_identity_pool.cognito_identity_pool.*.arn, [""]), 0)
}
