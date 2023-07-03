variable "vpclattice_auth_policy_policy" {
  description = "he ID or Amazon Resource Name (ARN) of the service network or service for which the policy is created"
  type        = string
}
variable "vpclattice_auth_policy_resource_identifier" {
  description = "The auth policy. The policy string in JSON must not contain newlines or blank lines"
  type        = string
}

