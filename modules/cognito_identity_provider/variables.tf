variable "cognito_identity_provider_attribute_mapping" {
  description = "The map of attribute mapping of user pool attributes. AttributeMapping in AWS API documentation"
  type        = map(string)
  default     = {}
}
variable "cognito_identity_provider_idp_identifiers" {
  description = "The list of identity providers"
  type        = list(string)
  default     = []
}
variable "cognito_identity_provider_provider_details" {
  description = "The map of identity details, such as access token"
  type        = map(string)
}
variable "cognito_identity_provider_provider_name" {
  description = "The provider name"
  type        = string
}
variable "cognito_identity_provider_provider_type" {
  description = "The provider type. See AWS API for valid values"
  type        = string
}
variable "cognito_identity_provider_user_pool_id" {
  description = "The user pool id"
  type        = string
}
