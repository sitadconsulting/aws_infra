variable "datazone_form_type_description" {
  description = "(Optional) Description of form type. Must have a length of between 1 and 2048 characters"
  type        = string
  default     = null
}
variable "datazone_form_type_domain_identifier" {
  description = "(Required) Identifier of the domain"
  type        = string
}
variable "datazone_form_type_name" {
  description = "(Required) Name of the form type. Must be the name of the structure in smithy document"
  type        = string
}
variable "datazone_form_type_owning_project_identifier" {
  description = "(Required) Identifier of project that owns the form type. Must follow regex of ^[a-zA-Z0-9_-]{1,36}"
  type        = string
}
variable "datazone_form_type_status" {
  description = "(Optional) Status of form type. Must be \"ENABLED\" or \"DISABLED\" If status is set to \"ENABLED\" terraform cannot delete the resource until it is manually changed in the AWS console"
  type        = string
  default     = null
}
variable "datazone_form_type_model" {
  description = "(Required) Object of the model of the form type that contains the following attributes"
  type        = list(object({
    smithy = string
  }))
}
