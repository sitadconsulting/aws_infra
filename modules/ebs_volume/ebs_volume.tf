resource "aws_ebs_volume" "ebs_volume" {
  availability_zone          = var.ebs_volume_availability_zone
  encrypted                  = var.ebs_volume_encrypted
  final_snapshot             = var.ebs_volume_final_snapshot
  iops                       = var.ebs_volume_iops
  kms_key_id                 = var.ebs_volume_kms_key_id
  multi_attach_enabled       = var.ebs_volume_multi_attach_enabled
  outpost_arn                = var.ebs_volume_outpost_arn
  size                       = var.ebs_volume_size
  snapshot_id                = var.ebs_volume_snapshot_id
  tags                       = var.ebs_volume_tags
  throughput                 = var.ebs_volume_throughput
  type                       = var.ebs_volume_type
  volume_initialization_rate = var.ebs_volume_volume_initialization_rate
}
