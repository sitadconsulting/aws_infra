variable "opensearchserverless_security_config_description" {
  description = "Description of the security configuration"
  type        = string
  default     = ""
}
variable "opensearchserverless_security_config_name" {
  description = "Name of the configuration"
  type        = string
}
variable "opensearchserverless_security_config_type" {
  description = "Type of configuration. Must be saml"
  type        = string
}
variable "opensearchserverless_security_config_saml_options" {
  description = " Configuration block for SAML options"
  type        = list(object({
    group_attribute = optional(string)
    metadata        = string
    session_timeout = optional(number)
    user_attribute  = optional(string)
  }))
}
