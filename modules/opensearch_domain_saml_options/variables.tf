variable "opensearch_domain_saml_options_domain_name" {
  description = "Name of the domain"
  type        = string
}
variable "opensearch_domain_saml_options_saml_options" {
  description = "SAML authentication options for an AWS OpenSearch Domain"
  type        = list(object({
    enabled                 = optional(bool)
    master_backend_role     = optional(string)
    master_user_name        = optional(string)
    roles_key               = optional(string)
    session_timeout_minutes = optional(number)
    subject_key             = optional(string)
    idp                     = optional(list(object({
      entity_id        = string
      metadata_content = string
    })))
  }))
  default     = []
}
