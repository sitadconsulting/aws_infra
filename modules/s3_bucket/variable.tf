variable "s3_bucket_bucket" {
  description = "Name of the bucket. If omitted, Terraform will assign a random, unique name"
  type        = string
  default     = ""
}
variable "s3_bucket_bucket_prefix" {
  description = "Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket"
  type        = string
  default     = null
}
variable "s3_bucket_force_destroy" {
  description = "Whether all objects (including any locked objects) should be deleted from the bucket when the bucket is destroyed so that the bucket can be destroyed without error"
  type        = bool
  default     = false
}
variable "s3_bucket_object_lock_enabled" {
  description = "Indicates whether this bucket has an Object Lock configuration enabled. Valid values are true or false"
  type        = bool
  default     = false
}
variable "s3_bucket_tags" {
  description = "Map of tags to assign to the bucket"
  type        = map(string)
  default     = {}
}
