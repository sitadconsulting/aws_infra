variable "api_gateway_usage_plan_description" {
  description = "(Optional) Description of a usage plan"
  type        = string
  default     = null
}
variable "api_gateway_usage_plan_name" {
  description = "(Required) Name of the usage plan"
  type        = string
}
variable "api_gateway_usage_plan_product_code" {
  description = "(Optional) AWS Marketplace product identifier to associate with the usage plan as a SaaS product on AWS Marketplace"
  type        = string
  default     = null
}
variable "api_gateway_usage_plan_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "api_gateway_usage_plan_api_stages" {
  description = "(Optional) Associated API stages of the usage plan"
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
  description = "(Optional) Quota settings of the usage plan"
  type        = list(object({
    limit  = number
    offset = optional(number)
    period = string
  }))
  default     = []
}
variable "api_gateway_usage_plan_throttle_settings" {
  description = "(Optional) Throttling limits of the usage plan"
  type        = list(object({
    burst_limit = optional(number)
    rate_limit  = optional(number)
  }))
  default     = []
}
