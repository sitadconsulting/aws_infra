resource "aws_cloudwatch_log_destination" "cloudwatch_log_destination" {
  name       = var.cloudwatch_log_destination_name
  role_arn   = var.cloudwatch_log_destination_role_arn
  tags       = var.cloudwatch_log_destination_tags
  target_arn = var.cloudwatch_log_destination_target_arn
}
