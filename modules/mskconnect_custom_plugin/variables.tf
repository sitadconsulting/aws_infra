variable "mskconnect_custom_plugin_content_type" {
  description = "The type of the plugin file. Allowed values are ZIP and JAR"
  type        = string
}
variable "mskconnect_custom_plugin_description" {
  description = "A summary description of the custom plugin"
  type        = string
  default     = ""
}
variable "mskconnect_custom_plugin_name" {
  description = "The name of the custom plugin"
  type        = string
}
variable "mskconnect_custom_plugin_location" {
  description = "Information about the location of a custom plugin"
  type        = list(object({
    s3  = list(object({
     bucket_arn     = string
     file_key       = string
     object_version = optional(string)
    }))
  }))
}
