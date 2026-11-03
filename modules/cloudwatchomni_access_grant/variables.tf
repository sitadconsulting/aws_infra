variable "cloudwatchomni_access_grant_domain_id" {
  description = "(Required) ID of the CloudWatch Omni domain that contains the space. Changing this forces a new resource"
  type        = string
}
variable "cloudwatchomni_access_grant_name" {
  description = "(Required) Name of the access grant. Must be 1-64 characters and contain only letters, numbers, underscores (_) and hyphens (-). Changing this forces a new resource"
  type        = string
}
variable "cloudwatchomni_access_grant_permission" {
  description = "(Required) Permission to grant. Valid values are SPACE_ADMIN, READ, READ_WRITE_DELETE and CUSTOM. Changing this forces a new resource"
  type        = string
}
variable "cloudwatchomni_access_grant_space_id" {
  description = "(Required) ID of the CloudWatch Omni space to scope the grant to. Changing this forces a new resource"
  type        = string
}
variable "cloudwatchomni_access_grant_tags" {
  description = "(Optional) Map of tags assigned to the resource"
  type        = map(string)
  default     = {}
}
variable "cloudwatchomni_access_grant_principal" {
  description = "(Required) Principal receiving the grant. Changing this forces a new resource"
  type        = list(object({
    principal_id        = optional(string)
    principal_type      = string
    principal_attribute = optional(list(object({
      key   = string
      value = string
    })), [])
  }))
}
variable "cloudwatchomni_access_grant_scoped_action" {
  description = "(Optional) Group of actions to allow, with the resource scopes and conditions that limit them. Up to 20 blocks. Required for the CUSTOM permission, and can also be used with the other permissions. Changing this forces a new resource"
  type        = list(object({
    actions  = list(string)
    resource = optional(list(object({
      resource_arns   = optional(list(string))
      resource_type   = string
      signal_types    = optional(list(string))
      tags            = optional(map(string))
      row_scope_group = optional(list(object({
        row_scope = list(object({
          field    = string
          operator = string
          values   = list(string)
        }))
      })), [])
    })), [])
  }))
  default     = []
}
