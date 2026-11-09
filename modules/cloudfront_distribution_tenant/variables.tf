variable "cloudfront_distribution_tenant_connection_group_id" {
  description = "(Optional) - ID of the connection group for the distribution tenant. If not specified, CloudFront uses the default connection group"
  type        = string
  default     = null
}
variable "cloudfront_distribution_tenant_distribution_id" {
  description = "(Required) - ID of the multi-tenant distribution"
  type        = string
}
variable "cloudfront_distribution_tenant_domain" {
  description = "(Required) - Set of domains associated with the distribution tenant"
  type        = string
}
variable "cloudfront_distribution_tenant_enabled" {
  description = "(Optional) - Whether the distribution tenant is enabled to serve traffic. Defaults to true"
  type        = bool
  default     = true
}
variable "cloudfront_distribution_tenant_name" {
  description = "(Required) - Name of the distribution tenant"
  type        = string
}
variable "cloudfront_distribution_tenant_wait_for_deployment" {
  description = "(Optional) - If enabled, the resource will wait for the distribution tenant status to change from InProgress to Deployed. Setting this to false will skip the process. Default: true"
  type        = bool
  default     = true
}
variable "cloudfront_distribution_tenant_tags" {
  description = "(Optional) - Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "cloudfront_distribution_tenant_customizations" {
  description = "(Optional) - Customizations for the distribution tenant (maximum one)"
  type        = list(object({
    certificate     = optional(list(object({
      arn = optional(string)
    })), [])
    geo_restriction = optional(list(object({
      restriction_type = optional(string)
      locations        = optional(list(string))
    })), [])
    web_acl         = optional(list(object({
      action = optional(string)
      arn    = optional(string)
    })), [])
  }))
  default     = []
}
variable "cloudfront_distribution_tenant_managed_certificate_request" {
  description = "(Optional) - Managed certificate request for CloudFront managed ACM certificate (maximum one)"
  type        = list(object({
    certificate_transparency_logging_preference = optional(string)
    primary_domain_name                         = optional(string)
    validation_token_host                       = optional(string)
  }))
  default     = []
}
variable "cloudfront_distribution_tenant_parameter" {
  description = "(Optional) - Set of parameter values for the distribution tenant"
  type        = list(object({
    name  = string
    value = string
  }))
  default     = []
}
