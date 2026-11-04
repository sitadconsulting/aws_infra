resource "aws_synthetics_group_association" "synthetics_group_association" {
  group_name = var.synthetics_group_association_group_name
  canary_arn = var.synthetics_group_association_canary_arn
}
