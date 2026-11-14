variable "datazone_environment_account_identifier" {
  description = "(Optional) The ID of the Amazon Web Services account where the environment exists "
  type        = string
  default     = null
}
variable "datazone_environment_account_region" {
  description = "(Optional) The Amazon Web Services region where the environment exists"
  type        = string
  default     = null
}
variable "datazone_environment_blueprint_identifier" {
  description = "(Optional) The blueprint with which the environment is created"
  type        = string
  default     = null
}
variable "datazone_environment_description" {
  description = "(Optional) The description of the environment"
  type        = string
  default     = null
}
variable "datazone_environment_domain_identifier" {
  description = "(Required) The ID of the domain where the environment exists"
  type        = string
}
variable "datazone_environment_glossary_terms" {
  description = "(Optional) The business glossary terms that can be used in this environment"
  type        = string
  default     = null
}
variable "datazone_environment_name" {
  description = "(Required) The name of the environment"
  type        = string
}
variable "datazone_environment_profile_identifier" {
  description = "(Required) The ID of the profile with which the environment is created"
  type        = string
}
variable "datazone_environment_project_identifier" {
  description = "(Required) The ID of the project where the environment exists"
  type        = string
}
variable "datazone_environment_user_parameters" {
  description = "Optional) The user parameters that are used in the environment. Changing these values recreates the resource"
  type        = list(object({
    name  = string
    value = string
  }))
  default     = []
}
