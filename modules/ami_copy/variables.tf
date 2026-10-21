variable "ami_copy_destination_outpost_arn" {
  description = "(Optional) ARN of the Outpost to which to copy the AMI. Only specify this parameter when copying an AMI from an AWS Region to an Outpost. The AMI must be in the Region of the destination Outpost"
  type        = string
  default     = null
}
variable "ami_copy_encrypted" {
  description = "(Optional) Whether the destination snapshots of the copied image should be encrypted. Defaults to false"
  type        = bool
  default     = null
}
variable "ami_copy_kms_key_id" {
  description = "(Optional) Full ARN of the KMS Key to use when encrypting the snapshots of an image during a copy operation. If not specified, then the default AWS KMS Key will be used"
  type        = string
  default     = null
}
variable "ami_copy_name" {
  description = "(Required) Region-unique name for the AMI"
  type        = string
}
variable "ami_copy_source_ami_id" {
  description = "(Required) ID of the AMI to copy. This ID must be valid in the region given by source_ami_region"
  type        = string
}
variable "ami_copy_source_ami_region" {
  description = "(Required) Region from which the AMI will be copied. This may be the same as the AWS provider region in order to create a copy within the same region"
  type        = string
}
variable "ami_copy_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
