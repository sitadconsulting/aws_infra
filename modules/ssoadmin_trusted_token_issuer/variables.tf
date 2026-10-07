variable "ssoadmin_trusted_token_issuer_client_token" {
  description = "A unique, case-sensitive ID that you provide to ensure the idempotency of the request. AWS generates a random value when not provided"
  type        = string
  default     = null
}
variable "ssoadmin_trusted_token_issuer_instance_arn" {
  description = "ARN of the instance of IAM Identity Center"
  type        = string
}
variable "ssoadmin_trusted_token_issuer_name" {
  description = "Name of the trusted token issuer"
  type        = string
}
variable "ssoadmin_trusted_token_issuer_tags" {
  description = "Key-value mapping of resource tags"
  type        = map(string)
  default     = {}
}
variable "ssoadmin_trusted_token_issuer_trusted_token_issuer_type" {
  description = "Specifies the type of the trusted token issuer. Valid values are OIDC_JWT"
  type        = string
  default     = "OIDC_JWT"
}
variable "ssoadmin_trusted_token_issuer_trusted_token_issuer_configuration" {
  description = "A block that specifies settings that apply to the trusted token issuer, these change depending on the type you specify in trusted_token_issuer_type"
  type        = list(object({
    oidc_jwt_configuration = list(object({
      claim_attribute_path          = string
      identity_store_attribute_path = string
      issuer_url                    = string
      jwks_retrieval_option         = string
    }))
  }))
}
