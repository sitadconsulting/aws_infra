variable "appintegrations_data_integration_description" {
  description = "(Optional) Description of the Data Integration"
  type        = string
  default     = null
}
variable "appintegrations_data_integration_kms_key" {
  description = "(Required) KMS key ARN for the Data Integration"
  type        = string
}
variable "appintegrations_data_integration_name" {
  description = "(Required) Name of the Data Integration"
  type        = string
}
variable "appintegrations_data_integration_source_uri" {
  description = "(Required) URI of the data source. Create an AppFlow Connector Profile and reference the name of the profile in the URL. An example of this value for Salesforce is Salesforce://AppFlow/example where example is the name of the AppFlow Connector Profile"
  type        = string
}
variable "appintegrations_data_integration_tags" {
  description = "(Optional) Tags to apply to the Data Integration"
  type        = map(string)
  default     = {}
}
variable "appintegrations_data_integration_schedule_config" {
  description = "(Required) Configuration block that defines the name of the data and how often it should be pulled from the source"
  type        = list(object({
    first_execution_from = string
    object               = string
    schedule_expression  = string
  }))
}
