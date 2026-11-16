variable "detective_organization_configuration_auto_enable" {
  description = "(Required) When this setting is enabled, all new accounts that are created in, or added to, the organization are added as a member accounts of the organization’s Detective delegated administrator and Detective is enabled in that AWS Region"
  type        = bool
}
variable "detective_organization_configuration_graph_arn" {
  description = "(Required) ARN of the Detective behavior graph"
  type        = string
}
