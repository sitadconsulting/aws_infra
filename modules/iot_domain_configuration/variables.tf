variable "iot_domain_configuration_application_protocol" {
  description = "(Optional) An enumerated string that speciﬁes the application-layer protocol. Valid values are SECURE_MQTT, MQTT_WSS, HTTPS or DEFAULT"
  type        = string
  default     = null
}
variable "iot_domain_configuration_authentication_type" {
  description = "(Optional) An enumerated string that speciﬁes the authentication type. Valid values are CUSTOM_AUTH_X509, CUSTOM_AUTH, AWS_X509, AWS_SIGV4 or DEFAULT"
  type        = string
  default     = null
}
variable "iot_domain_configuration_domain_name" {
  description = "(Optional) Fully-qualified domain name"
  type        = string
  default     = null
}
variable "iot_domain_configuration_name" {
  description = "(Required) The name of the domain configuration. This value must be unique to a region"
  type        = string
}
variable "iot_domain_configuration_server_certificate_arns" {
  description = "(Optional) The ARNs of the certificates that IoT passes to the device during the TLS handshake. Currently you can specify only one certificate ARN. This value is not required for Amazon Web Services-managed domains. When using a custom domain_name, the cert must include it"
  type        = list(string)
  default     = null
}
variable "iot_domain_configuration_service_type" {
  description = "(Optional) The type of service delivered by the endpoint. Note: Amazon Web Services IoT Core currently supports only the DATA service type"
  type        = string
  default     = null
}
variable "iot_domain_configuration_status" {
  description = "(Optional) The status to which the domain configuration should be set. Valid values are ENABLED and DISABLED"
  type        = string
  default     = null
}
variable "iot_domain_configuration_tags" {
  description = "(Optional) Map of tags to assign to this resource"
  type        = map(string)
  default     = {}
}
variable "iot_domain_configuration_validation_certificate_arn" {
  description = "(Optional) The certificate used to validate the server certificate and prove domain name ownership. This certificate must be signed by a public certificate authority. This value is not required for Amazon Web Services-managed domains"
  type        = string
  default     = null
}
variable "iot_domain_configuration_authorizer_config" {
  description = "(Optional) An object that specifies the authorization service for a domain"
  type        = list(object({
    allow_authorizer_override = optional(bool)
    default_authorizer_name   = optional(string)
  }))
  default     = []
}
variable "iot_domain_configuration_tls_config" {
  description = "(Optional) An object that specifies the TLS configuration for a domain"
  type        = list(object({
    security_policy = optional(string)
  }))
  default     = []
}
