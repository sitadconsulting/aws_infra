resource "aws_lambda_resource_policy" "lambda_resource_policy" {
  policy       = var.lambda_resource_policy_policy
  resource_arn = var.lambda_resource_policy_resource_arn
}
