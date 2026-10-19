variable "iam_openid_connect_provider_client_id_list" {
  description = "(Required) List of client IDs (audiences) that identify the application registered with the OpenID Connect provider. This is the value sent as the client_id parameter in OAuth requests"
  type        = list(string)
}
variable "iam_openid_connect_provider_tags" {
  description = "(Optional) Map of resource tags for the IAM OIDC provider"
  type        = map(string)
  default     = {}
}
variable "iam_openid_connect_provider_thumbprint_list" {
  description = "(Optional) List of server certificate thumbprints for the OpenID Connect (OIDC) identity provider's server certificate(s). For certain OIDC identity providers (e.g., Auth0, GitHub, GitLab, Google, or those using an Amazon S3-hosted JWKS endpoint), AWS relies on its own library of trusted root certificate authorities (CAs) for validation instead of using any configured thumbprints. In these cases, any configured thumbprint_list is retained in the configuration but not used for verification. For other IdPs, if no thumbprint_list is provided, IAM automatically retrieves and uses the top intermediate CA thumbprint from the OIDC IdP server certificate. However, if a thumbprint_list is initially configured and later removed, Terraform does not prompt IAM to retrieve a thumbprint the same way. Instead, it continues using the original thumbprint list from the initial configuration. This differs from the behavior when creating an aws_iam_openid_connect_provider without a thumbprint_list"
  type        = list(string)
}
variable "iam_openid_connect_provider_url" {
  description = " (Required) URL of the identity provider, corresponding to the iss claim"
  type        = string
}
