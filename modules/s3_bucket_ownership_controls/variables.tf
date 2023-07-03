variable "s3_bucket_ownership_controls_bucket" {
  description = "Name of the bucket that you want to associate with this access point"
  type        = string
}
variable "s3_bucket_ownership_controls_rule" {
  description = "Ownership Controls rules configuration"
  type        = list(object({
    object_ownership = string
  }))
  default     = []
}
