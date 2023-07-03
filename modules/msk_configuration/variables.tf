variable "msk_configuration_description" {
  description = "Description of the configuration"
  type        = string
  default     = 
}
variable "msk_configuration_kafka_versions" {
  description = "List of Apache Kafka versions which can use this configuration"
  type        = list(string)
}
variable "msk_configuration_name" {
  description = "Name of the configuration"
  type        = string
}
variable "msk_configuration_server_properties" {
  description = "Contents of the server.properties file"
  type        = string
}
