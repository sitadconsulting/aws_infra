variable "opensearch_domain_policy_access_policies" {
  description = "IAM policy document specifying the access policies for the domain"
  type        = string
  default     = ""
}
variable "opensearch_domain_policy_domain_name" {
  description = "Name of the domain"
  type        = string
}
