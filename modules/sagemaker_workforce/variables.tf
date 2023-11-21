variable "sagemaker_workforce_workforce_name" {
  description = "The name of the Workforce (must be unique)"
  type        = string
}
variable "sagemaker_workforce_cognito_config" {
  description = "Use this parameter to configure an Amazon Cognito private workforce. A single Cognito workforce is created using and corresponds to a single Amazon Cognito user pool. Conflicts with oidc_config"
  type        = list(object({
    client_id = string
    user_pool = string
  }))
  default     = []
}
variable "sagemaker_workforce_oidc_config" {
  description = "Use this parameter to configure a private workforce using your own OIDC Identity Provider. Conflicts with cognito_config"
  type        = list(object({
    authorization_endpoint = string
    client_id              = string
    client_secret          = string
    issuer                 = string
    jwks_uri               = string
    logout_endpoint        = string
    token_endpoint         = string
    user_info_endpoint     = string
  }))
  default     = []
}
variable "sagemaker_workforce_source_ip_config" {
  description = "A list of IP address ranges Used to create an allow list of IP addresses for a private workforce. By default, a workforce isn't restricted to specific IP addresses"
  type        = list(object({
    cidrs = list(string)
  }))
  default     = []
}
variable "sagemaker_workforce_workforce_vpc_config" {
  description = "configure a workforce using VPC"
  type        = list(object({
    security_group_ids = optional(list(string))
    subnets            = optional(list(string))
    vpc_id             = optional(string)
  }))
  default     = []
}
