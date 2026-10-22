variable "ec2_image_block_public_access_state" {
  description = "(Required) The state of block public access for AMIs at the account level in the configured AWS Region. Valid values: unblocked and block-new-sharing"
  type        = string
}
