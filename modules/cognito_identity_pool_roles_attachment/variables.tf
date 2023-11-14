variable "cognito_identity_pool_roles_attachment_identity_pool_id" {
  description = "An identity pool ID in the format REGION_GUID"
  type        = string
}
variable "cognito_identity_pool_roles_attachment_roles" {
  description = "The map of roles associated with this pool. For a given role, the key will be either \"authenticated\" or \"unauthenticated\" and the value will be the Role ARN"
  type        = map(string)
}
variable "cognito_identity_pool_roles_attachment_role_mapping" {
  description = "A List of Role Mapping"
  type        = list(object({
    identity_provider         = string
    ambiguous_role_resolution = optional(string)
    type                      = string
    mapping_rule              = optional(list(object({
      claim      = string
      match_type = string
      role_arn   = string
      value      = string
    })), []) 
  }))
  default     = []
}
