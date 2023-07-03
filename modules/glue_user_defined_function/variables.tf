variable "glue_user_defined_function_catalog_id" {
  description = "ID of the Glue Catalog to create the function in. If omitted, this defaults to the AWS Account ID"
  type        = string
  default     = ""
}
variable "glue_user_defined_function_class_name" {
  description = "The Java class that contains the function code"
  type        = string
}
variable "glue_user_defined_function_database_name" {
  description = "The name of the Database to create the Function in"
  type        = string
}
variable "glue_user_defined_function_name" {
  description = "The name of the function"
  type        = string
}
variable "glue_user_defined_function_owner_name" {
  description = "The owner of the function"
  type        = string
}
variable "glue_user_defined_function_owner_type" {
  description = "The owner type. can be one of USER, ROLE, and GROUP"
  type        = string
}
variable "glue_user_defined_function_resource_uris" {
  description = "Resource URIs configuration"
  type        = list(object({
    resource_type = string
    uri           = string
  }))
  default     = []
}
