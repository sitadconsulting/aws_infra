resource "aws_ami_from_instance" "ami_from_instance" {
  name                    = var.ami_from_instance_name
  source_instance_id      = var.ami_from_instance_source_instance_id
  snapshot_without_reboot = var.ami_from_instance_snapshot_without_reboot
  tags                    = var.ami_from_instance_tags
}
