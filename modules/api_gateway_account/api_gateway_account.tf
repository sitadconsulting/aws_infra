resource "aws_api_gateway_account" "api_gateway_account" {
  cloudwatch_role_arn = var.api_gateway_account_cloudwatch_role_arn
}
