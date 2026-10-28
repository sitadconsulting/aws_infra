variable "athena_data_catalog_description" {
  description = "(Required) Description of the data catalog"
  type        = string
}
variable "athena_data_catalog_name" {
  description = "(Required) Name of the data catalog. The catalog name must be unique for the AWS account and can use a maximum of 128 alphanumeric, underscore, at sign, or hyphen characters"
  type        = string
}
variable "athena_data_catalog_parameters" {
  description = "(Required) Key value pairs that specifies the Lambda function or functions to use for the data catalog. The mapping used depends on the catalog type"
  type        = map(string)
}
variable "athena_data_catalog_type" {
  description = "(Required) Type of data catalog: LAMBDA for a federated catalog, GLUE for AWS Glue Catalog, or HIVE for an external hive metastore"
  type        = string
}
variable "athena_data_catalog_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
