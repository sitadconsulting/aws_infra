resource "aws_iot_policy" "iot_policy" {
  name   = var.iot_policy_name
  policy = var.iot_policy_policy
  tags   = var.iot_policy_tags
}
