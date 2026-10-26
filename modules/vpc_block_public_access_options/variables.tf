variable "vpc_block_public_access_options_internet_gateway_block_mode" {
  description = "(Required) Block mode. Needs to be one of block-bidirectional, block-ingress, off. If this resource is deleted, then this value will be set to off in the AWS account and region"
  type        = string
}
