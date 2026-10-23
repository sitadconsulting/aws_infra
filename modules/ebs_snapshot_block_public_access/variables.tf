variable "ebs_snapshot_block_public_access_stated" {
  description = "(Required) The mode in which to enable \"Block public access for snapshots\" for the region. Allowed values are block-all-sharing, block-new-sharing, unblocked"
  type        = string
}
