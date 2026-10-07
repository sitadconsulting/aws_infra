variable "ssoadmin_customer_managed_policy_attachment_instance_arn" {
  description = "ARN of the SSO Instance under which the operation will be executed "
  type       = string
}
variable "ssoadmin_customer_managed_policy_attachment_permission_set_arn" {
  description = "ARN of the Permission Set"
  type       = string
}
variable "ssoadmin_customer_managed_policy_attachment_customer_managed_policy_reference" {
  description = "Specifies the name and path of a customer managed policy"
  type       = list(object({
    name  = string
    path  = optional(string)
  }))
}
