variable "msk_configuration_description" {
  description = "(Optional) Description of the configuration"
  type        = string
  default     = null
}
variable "msk_configuration_kafka_versions" {
  description = "(Optional) List of Apache Kafka versions which can use this configuration"
  type        = list(string)
}
variable "msk_configuration_name" {
  description = "(Required) Name of the configuration"
  type        = string
}
variable "msk_configuration_server_properties" {
  description = "(Required) Contents of the server.properties file"
  type        = string
}
