variable "datazone_environment_blueprint_configuration_domain_id" {
  description = "(Required) ID of the Domain"
  type        = string
}
variable "datazone_environment_blueprint_configuration_enabled_regions" {
  description = "(Required) - Regions in which the blueprint is enabled"
  type        = string
}
variable "datazone_environment_blueprint_configuration_environment_blueprint_id" {
  description = "(Required) ID of the Environment Blueprint"
  type        = string
}
variable "datazone_environment_blueprint_configuration_global_parameters" {
  description = "(Optional) A map of global parameters to configure for the blueprint across all regions"
  type        = map(string)
  default     = {}
}
variable "datazone_environment_blueprint_configuration_manage_access_role_arn" {
  description = "(Optional) ARN of the manage access role with which this blueprint is created"
  type        = string
  default     = null
}
variable "datazone_environment_blueprint_configuration_provisioning_role_arn" {
  description = "(Optional) ARN of the provisioning role with which this blueprint is created"
  type        = string
  default     = null
}
variable "datazone_environment_blueprint_configuration_regional_parameters" {
  description = "(Optional) Parameters for each region in which the blueprint is enabled"
  type        = map(string)
  default     = {}
}
