variable "glue_connection_catalog_id" {
  description = "The ID of the Data Catalog in which to create the connection. If none is supplied, the AWS account ID is used by default"
  type        = string
  default     = ""
}
variable "glue_connection_connection_properties" {
  description = "A map of key-value pairs used as parameters for this connection"
  type        = map(string)
  default     = {}
}
variable "glue_connection_connection_type" {
  description = "The type of the connection. Supported are: CUSTOM, JDBC, KAFKA, MARKETPLACE, MONGODB, and NETWORK. Defaults to JBDC"
  type        = string
  default     = "JDBC"
}
variable "glue_connection_description" {
  description = "Description of the connection"
  type        = string
  default     = ""
}
variable "glue_connection_match_criteria" {
  description = "A list of criteria that can be used in selecting this connection"
  type        = list(string)
  default     = []
}
variable "glue_connection_name" {
  description = "The name of the connection"
  type        = string
}
variable "glue_connection_tags" {
  description = "Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "glue_connection_physical_connection_requirements" {
  description = "A map of physical connection requirements, such as VPC and SecurityGroup"
  type        = list(object({
    availability_zone      = optional(string)
    security_group_id_list = optional(list(string))
    subnet_id              = optional(string)
  }))
  default     = []
}
