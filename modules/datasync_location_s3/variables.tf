variable "datasync_location_s3_agent_arns" {
  description = "(Optional) (Amazon S3 on Outposts only) ARN of the DataSync agent on the Outpost"
  type        = string
  default     = null
}
variable "datasync_location_s3_s3_bucket_arn" {
  description = "(Required) ARN of the S3 bucket, or the Amazon S3 access point if the S3 bucket is located on an AWS Outposts resource"
  type        = string
}
variable "datasync_location_s3_s3_storage_class" {
  description = "(Optional) Amazon S3 storage class that you want to store your files in when this location is used as a task destination"
  type        = string
  default     = null
}
variable "datasync_location_s3_subdirectory" {
  description = "(Required) Prefix to perform actions as source or destination"
  type        = string
}
variable "datasync_location_s3_tags" {
  description = "(Optional) Key-value pairs of resource tags to assign to the DataSync Location"
  type        = map(string)
  default     = {}
}
variable "datasync_location_s3_s3_config" {
  description = "(Required) Configuration block containing information for connecting to S3"
  type        = list(object({
    bucket_access_role_arn = string
  }))
}
