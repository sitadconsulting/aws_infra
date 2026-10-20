resource "aws_kinesis_resource_policy" "kinesis_resource_policy" {
  policy       = var.kinesis_resource_policy_policy
  resource_arn = var.kinesis_resource_policy_resource_arn
}
