variable "appconfig_hosted_configuration_version_application_id" {
  description = "(Required, Forces new resource) Application ID"
  type        = string
}
variable "appconfig_hosted_configuration_version_configuration_profile_id" {
  description = "(Required, Forces new resource) Configuration profile ID"
  type        = string
}
variable "appconfig_hosted_configuration_version_content" {
  description = "(Required, Forces new resource) Content of the configuration or the configuration data"
  type        = string
}
variable "appconfig_hosted_configuration_version_content_type" {
  description = "(Required, Forces new resource) Standard MIME type describing the format of the configuration content"
  type        = string
}
variable "appconfig_hosted_configuration_version_description" {
  description = "(Optional, Forces new resource) Description of the configuration"
  type        = string
  default     = null
}
variable "appconfig_hosted_configuration_version_version_label" {
  description = "(Optional, Forces new resource) User-defined label for the AppConfig hosted configuration version. This value must contain at least one non-numeric character"
  type        = string
  default     = null
}
