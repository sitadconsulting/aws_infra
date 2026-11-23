resource "aws_iot_policy_attachment" "iot_policy_attachment" {
  policy = var.iot_policy_attachment_policy
  target = var.iot_policy_attachment_target
}
