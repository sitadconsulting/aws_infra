resource "aws_ebs_volume_copy" "ebs_volume_copy" {
  iops             = var.ebs_volume_copy_iops
  size             = var.ebs_volume_copy_size
  source_volume_id = var.ebs_volume_copy_source_volume_id
  tags             = var.ebs_volume_copy_tags
  throughput       = var.ebs_volume_copy_throughput
  volume_type      = var.ebs_volume_copy_volume_type
}
