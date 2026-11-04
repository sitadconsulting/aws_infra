variable "appconfig_deployment_application_id" {
  description = "(Required, Forces new resource) Application ID. Must be between 4 and 7 characters in length"
  type        = string
}
variable "appconfig_deployment_configuration_profile_id" {
  description = "(Required, Forces new resource) Configuration profile ID. Must be between 4 and 7 characters in length"
  type        = string
}
variable "appconfig_deployment_configuration_version" {
  description = "(Required, Forces new resource) Configuration version to deploy. Can be at most 1024 characters"
  type        = string
}
variable "appconfig_deployment_deployment_strategy_id" {
  description = "(Required, Forces new resource) Deployment strategy ID or name of a predefined deployment strategy"
  type        = string
}
variable "appconfig_deployment_description" {
  description = "(Optional, Forces new resource) Description of the deployment. Can be at most 1024 characters"
  type        = string
  default     = null
}
variable "appconfig_deployment_environment_id" {
  description = "(Required, Forces new resource) Environment ID. Must be between 4 and 7 characters in length"
  type        = string
}
variable "appconfig_deployment_kms_key_identifier" {
  description = "(Optional, Forces new resource) KMS key identifier (key ID, key alias, or key ARN). AppConfig uses this to encrypt the configuration data using a customer managed key"
  type        = string
  default     = null
}
variable "appconfig_deployment_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
