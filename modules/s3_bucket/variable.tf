variable "environment" {
  description = "The name of the environment"
  default     = "DEV"
}
variable "aws_region" {
  description = "The name of the region"
  type        = string
  default     = "us-east-1"
}
variable "create_s3_bucket" {
  description = "Create s3 bucket"
  type        = bool
  default     = true
}
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(any)
  default     = {}
}
############################
# S3 bucket
############################
variable "bucket_name" {
  description = "The name of the bucket to create"
  type        = string
}
variable "s3_bucket_bucket" {
  description = "Name of the bucket. If omitted, Terraform will assign a random, unique name"
  type        = string
  default     = ""
}
variable "s3_bucket_bucket_prefix" {
  description = "Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket"
  type        = string
  default     = ""
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
