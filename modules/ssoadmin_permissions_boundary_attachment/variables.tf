variable "ssoadmin_permissions_boundary_attachment_instance_arn" {
  description = "ARN of the SSO Instance under which the operation will be executed"
  type        = string
}
variable "ssoadmin_permissions_boundary_attachment_permission_set_arn" {
  description = "ARN of the Permission Set"
  type        = string
}
variable "ssoadmin_permissions_boundary_attachment_permission_boundary" {
  description = "The permissions boundary policy"
  type        = list(object({
    managed_policy_arn                = optional(string)
    customer_managed_policy_reference = optional(list(object({
      name = string
      path = optional(string)
    })))
  }))
}
