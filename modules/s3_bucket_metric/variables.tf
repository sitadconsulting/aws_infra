variable "s3_bucket_metric_bucket" {
  description = "Name of the bucket to put metric configuration"
  type        = string
}
variable "s3_bucket_metric_name" {
  description = "Unique identifier of the metrics configuration for the bucket"
  type        = string
}
variable "s3_bucket_metric_filter" {
  description = "Object filtering that accepts a prefix, tags, or a logical AND of prefix and tags"
  type        = list(object({
    prefix = optional(string)
    tags   = optional(map(string))
  }))
  default     =  []
}
