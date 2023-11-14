output "cognito_user_status" {
  description =  "current user status"
  value       = element(concat(aws_cognito_user.cognito_user.*.status, [""]), 0)
}
output "cognito_user_sub" {
  description =  "unique user id that is never reassignable to another user"
  value       = element(concat(aws_cognito_user.cognito_user.*.sub, [""]), 0)
}
output "cognito_user_mfa_preference" {
  description =  "user's settings regarding MFA settings and preferences"
  value       = element(concat(aws_cognito_user.cognito_user.*.mfa_preference, [""]), 0)
}
