variable "acmpca_policy_resource_arn" {
  description = "(Required) ARN of the private CA to associate with the policy"
  type        = string
}
variable "acmpca_policy_policy" {
  description = "(Required) JSON-formatted IAM policy to attach to the specified private CA resource"
  type        = string
}
