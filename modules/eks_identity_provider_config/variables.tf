variable "eks_identity_provider_config_cluster_name" {
  description = "Name of the EKS Cluster"
  type        = string
}
variable "eks_identity_provider_config_tags" {
  description = "Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "eks_identity_provider_config_oidc" {
  description = "OpenID Connect identity provider configuration"
  type        = list(object({
    client_id                     = string
    groups_claim                  = optional(string)
    groups_prefix                 = optional(string)
    identity_provider_config_name = string  
    issuer_url                    = string
    required_claims               = optional(map(string))
    username_claim                = optional(string)
    username_prefix               = optional(string)
  }))
}
