variable "api_gateway_account_cloudwatch_role_arn" {
  description = "ARN of an IAM role for CloudWatch (to allow logging & monitoring). See more in AWS Docs. Logging & monitoring can be enabled/disabled and otherwise tuned on the API Gateway Stage level"
  type        = string
  default     = ""
}
