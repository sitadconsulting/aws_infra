resource "aws_synthetics_group" "synthetics_group" {
  name = var.synthetics_group_name
  tags = var.synthetics_group_tags
}
