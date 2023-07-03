variable "s3_bucket_public_access_block_bucket" {
  description = "S3 Bucket to which this Public Access Block configuration should be applied"
  type        = string
}
variable "s3_bucket_public_access_block_block_public_acls" {
  description = "Whether Amazon S3 should block public ACLs for this bucket. Defaults to false"
  type        = bool
  default     = true
}
variable "s3_bucket_public_access_block_block_public_policy" {
  description = "Whether Amazon S3 should block public bucket policies for this bucket. Defaults to false"
  type        = bool
  default     = true
}
variable "s3_bucket_public_access_block_ignore_public_acls" {
  description = "Whether Amazon S3 should ignore public ACLs for this bucket. Defaults to false"
  type        = bool
  default     = true
}
variable "s3_bucket_public_access_block_restrict_public_buckets" {
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket. Defaults to false"
  type        = bool
  default     = true
}
