resource "aws_ebs_snapshot_block_public_access" "ebs_snapshot_block_public_access" {
  state = var.ebs_snapshot_block_public_access_stated
}
