variable "cognito_user_pool_domain_certificate_arn" {
  description = "The ARN of an ISSUED ACM certificate in us-east-1 for a custom domain "
  type        = string
  default     = ""
}
variable "cognito_user_pool_domain_domain" {
  description = "For custom domains, this is the fully-qualified domain name, such as auth.example.com. For Amazon Cognito prefix domains, this is the prefix alone, such as auth"
  type        = string
}
variable "cognito_user_pool_domain_user_pool_id" {
  description = "The user pool ID"
  type        = string
}
