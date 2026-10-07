variable "ssoadmin_customer_managed_policy_attachments_exclusive_instance_arn" {
  description = "(Required) ARN of the SSO Instance"
  type        = string
}
variable "ssoadmin_customer_managed_policy_attachments_exclusive_permission_set_arn" {
  description = "(Required) ARN of the Permission Set"
  type        = string
}
variable "ssoadmin_customer_managed_policy_attachments_exclusive_customer_managed_policy_reference" {
  description = "(Optional) Specifies the names and paths of the customer managed policies to attach"
  type        = list(object({
    name = string
    path = optional(string)
  }))
  default     = []
}
