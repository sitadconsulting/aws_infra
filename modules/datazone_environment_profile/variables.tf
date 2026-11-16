variable "datazone_environment_profile_aws_account_id" {
  description = " (Required) - ID of the AWS account being used"
  type        = string
}
variable "datazone_environment_profile_aws_account_region" {
  description = "(Required) - Desired region for environment profile"
  type        = string
}
variable "datazone_environment_profile_description" {
  description = "(Optional) Description of environment profile"
  type        = string
  default     = null
}
variable "datazone_environment_profile_domain_identifier" {
  description = "(Required) - Domain Identifier for environment profile"
  type        = string
}
variable "datazone_environment_profile_environment_blueprint_identifier" {
  description = "(Required) - ID of the blueprint which the environment will be created with"
  type        = string
}
variable "datazone_environment_profile_name" {
  description = "(Required) - Name of the environment profile"
  type        = string
}
variable "datazone_environment_profile_project_identifier" {
  description = "(Required) - Project identifier for environment profile"
  type        = string
}
variable "datazone_environment_profile_user_parameters" {
  description = "(Optional) - Array of user parameters of the environment profile with the following attributes"
  type        = list(object({
    name  = string
    value = string
  }))
  default     = []
}
