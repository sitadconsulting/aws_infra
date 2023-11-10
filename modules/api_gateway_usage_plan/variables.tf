variable "api_gateway_usage_plan_description" {
  description = "Description of a usage plan"
  type        = string
  default     = ""
}
variable "api_gateway_usage_plan_name" {
  description = "Name of the usage plan"
  type        = string
}
variable "api_gateway_usage_plan_product_code" {
  description = "AWS Marketplace product identifier to associate with the usage plan as a SaaS product on AWS Marketplace"
  type        = string
  default     = null
}
variable "api_gateway_usage_plan_tags" {
  description = "Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "api_gateway_usage_plan_api_stages" {
  description = "Associated API stages of the usage plan"
  type        = list(object({
    api_id   = string
    stage    = string
    throttle = optional(list(object({
      burst_limit = optional(number)
      path        = string
      rate_limit  = optional(number)
    })), [])
  }))
  default     = []
}
variable "api_gateway_usage_plan_quota_settings" {
  description = "The quota settings of the usage plan"
  type        = list(object({
    limit  = number
    offset = optional(number)
    period = string
  }))
  default     = []
}
variable "api_gateway_usage_plan_throttle_settings" {
  description = " "
  type        = list(object({
    burst_limit = optional(number)
    rate_limit  = optional(number)
  }))
  default     = []
}
