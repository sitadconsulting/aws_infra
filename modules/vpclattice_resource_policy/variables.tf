variable "vpclattice_resource_policy_policy" {
  description = "An IAM policy. The policy string in JSON must not contain newlines or blank lines"
  type        = string
}
variable "vpclattice_resource_policy_resource_arn" {
  description = "The ID or Amazon Resource Name (ARN) of the service network or service for which the policy is created"
  type        = string
}
