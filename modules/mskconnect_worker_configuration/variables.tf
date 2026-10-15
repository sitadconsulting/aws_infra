variable "mskconnect_worker_configuration_description" {
  description = "A summary description of the worker configuration"
  type        = string
  default     = null
}
variable "mskconnect_worker_configuration_name" {
  description = "The name of the worker configuration"
  type        = string
}
variable "mskconnect_worker_configuration_properties_file_content" {
  description = "Contents of connect-distributed.properties file. The value can be either base64 encoded or in raw format"
  type        = string
}
variable "mskconnect_worker_configuration_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
