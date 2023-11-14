resource "aws_cognito_user_pool_domain" "cognito_user_pool_domain" {
  certificate_arn = var.cognito_user_pool_domain_certificate_arn
  domain          = var.cognito_user_pool_domain_domain
  user_pool_id    = var.cognito_user_pool_domain_user_pool_id
}
