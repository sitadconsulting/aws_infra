variable "cloudfront_continuous_deployment_policy_enabled" {
  description = "(Required) Whether this continuous deployment policy is enabled"
  type        = bool
}
variable "cloudfront_continuous_deployment_policy_staging_distribution_dns_names" {
  description = "(Required) CloudFront domain name of the staging distribution"
  type        = list(object({
    items    = list(string)
    quantity = number
  }))
}
variable "cloudfront_continuous_deployment_policy_traffic_config" {
  description = "(Required) Parameters for routing production traffic from primary to staging distributions"
  type        = list(object({
    type                 = string
    single_header_config = optional(list(object({
      header = string
      value  = string
    })), [])
    single_weight_config = optioonal(list(object({
      weight                    = number
      session_stickiness_config = optional(list(object({
        idle_ttl    = number
        maximum_ttl = number
      })), [])
    })), []) 
  }))
}
