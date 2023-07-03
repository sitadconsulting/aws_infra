variable "acmpca_policy_resource_arn" {
  description = "ARN of the private CA to associate with the policy"
  type        = string
  default     = null
}
variable "acmpca_policy_policy" {
  description = "JSON-formatted IAM policy to attach to the specified private CA resource"
  type        = string
  default     = null
}
