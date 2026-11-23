variable "iot_provisioning_template_description" {
  description = "(Optional) The description of the fleet provisioning template"
  type        = string
  default     = null
}
variable "iot_provisioning_template_enabled" {
  description = "(Optional) True to enable the fleet provisioning template, otherwise false"
  type        = bool
  default     = null
}
variable "iot_provisioning_template_name" {
  description = "(Required) The name of the fleet provisioning template"
  type        = string
}
variable "iot_provisioning_template_provisioning_role_arn" {
  description = "(Required) The role ARN for the role associated with the fleet provisioning template. This IoT role grants permission to provision a device"
  type        = string
}
variable "iot_provisioning_template_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "iot_provisioning_template_template_body" {
  description = "(Required) The JSON formatted contents of the fleet provisioning template"
  type        = string
}
variable "iot_provisioning_template_type" {
  description = "(Optional) The type you define in a provisioning template"
  type        = string
  default     = null
}
variable "iot_provisioning_template_pre_provisioning_hook" {
  description = "(Optional) Creates a pre-provisioning hook template"
  type        = list(object({
    payload_version = optional(string)
    target_arn      = optional(string)
  }))
  default     = []
}
