variable "cognito_resource_server_identifier" {
  description = "An identifier for the resource server"
  type        = string
}
variable "cognito_resource_server_name" {
  description = "A name for the resource server"
  type        = string
}
variable "cognito_resource_server_user_pool_id" {
  description = "User pool the client belongs to"
  type        = string
}
variable "cognito_resource_server_scope" {
  description = "A list of Authorization Scope"
  type        = list(object({
    scope_description = string
    scope_name        = string
  }))
  default     = []
}
