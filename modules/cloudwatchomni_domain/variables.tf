variable "cloudwatchomni_domain_identity_providers" {
  description = "(Required) Set of identity providers that users can sign in with. Valid values: IAM, IDC"
  type        = list(string)
  default     = null
}
variable "cloudwatchomni_domain_name" {
  description = "(Required) Name of the domain. Must be 3-63 characters, contain only lowercase letters, numbers, and hyphens, begin and end with a letter or number, and not contain consecutive hyphens. Changing the name changes the domain's custom endpoint URLs"
  type        = string
}
variable "cloudwatchomni_domain_identity_provider_configuration" {
  description = "(Optional) Identity provider configuration. Required when identity_providers includes IDC"
  type        = list(object({
    identity_center_configuration = list(object({
      identity_center_instance_arn = string
    }))
  }))
  default     = []
}
