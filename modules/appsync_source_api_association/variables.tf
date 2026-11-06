variable "appsync_source_api_association_description" {
  description = "(Optional) Description of the source API being merged"
  type        = string
  default     = null
}
variable "appsync_source_api_association_merged_api_arn" {
  description = "(Optional) ARN of the merged API. One of merged_api_arn or merged_api_id must be specified"
  type        = string
  default     = null
}
variable "appsync_source_api_association_merged_api_id" {
  description = "Optional) ID of the merged API. One of merged_api_arn or merged_api_id must be specified"
  type        = string
  default     = null
}
variable "appsync_source_api_association_source_api_arn" {
  description = "(Optional) ARN of the source API. One of source_api_arn or source_api_id must be specified"
  type        = string
  default     = null
}
variable "appsync_source_api_association_source_api_id" {
  description = "(Optional) ID of the source API. One of source_api_arn or source_api_id must be specified"
  type        = string
  default     = null
}
variable "appsync_source_api_association_source_api_association_config" {
  description = "(Optional) Source API Association configuration"
  type        = list(object({
    merge_type = string
  }))
  default     = []
}
