variable "glue_schema_compatibility" {
  description = "The compatibility mode of the schema. Values values are: NONE, DISABLED, BACKWARD, BACKWARD_ALL, FORWARD, FORWARD_ALL, FULL, and FULL_ALL"
  type        = string
}
variable "glue_schema_data_format" {
  description = "The data format of the schema definition. Valid values are AVRO, JSON and PROTOBUF"
  type        = string
}
variable "glue_schema_description" {
  description = "A description of the schema"
  type        = string
  default     = ""
}
variable "glue_schema_registry_arn" {
  description = "The ARN of the Glue Registry to create the schema in"
  type        = string
}
variable "glue_schema_schema_name" {
  description = "The Name of the schema"
  type        = string
}
variable "glue_schema_schema_definition" {
  description = "The schema definition using the data_format setting for schema_name"
  type        = string
}
variable "glue_schema_tags" {
  description = "Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
