variable "redshift_snapshot_copy_grant_kms_key_id" {
  description = "The unique identifier for the customer master key (CMK) that the grant applies to. Specify the key ID or the ARN of the CMK"
  type        = string
  default     = ""
}
variable "redshift_snapshot_copy_grant_snapshot_copy_grant_name" {
  description = "A friendly name for identifying the grant"
  type        = string
}
variable "redshift_snapshot_copy_grant_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
