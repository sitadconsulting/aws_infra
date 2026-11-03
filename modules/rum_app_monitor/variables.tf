variable "rum_app_monitor_name" {
  description = "(Required) The name of the log stream"
  type        = string
}
variable "rum_app_monitor_cw_log_enabled" {
  description = "(Optional) Data collected by RUM is kept by RUM for 30 days and then deleted. This parameter specifies whether RUM sends a copy of this telemetry data to Amazon CloudWatch Logs in your account. This enables you to keep the telemetry data for more than 30 days, but it does incur Amazon CloudWatch Logs charges. Default value is false"
  type        = bool
  default     = false
}
variable "rum_app_monitor_domain" {
  description = "(Optional) The top-level internet domain name for which your application has administrative authority. Exactly one of domain or domain_list must be specified"
  type        = string
  default     = null
}
variable "rum_app_monitor_domain_list" {
  description = "(Optional) A list of internet domain names for which your application has administrative authority. Exactly one of domain or domain_list must be specified "
  type        = list(string)
  default     = null
}
variable "rum_app_monitor_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "rum_app_monitor_app_monitor_configuration" {
  description = "(Optional) configuration data for the app monitor"
  type        = list(object({
    allow_cookies       = optional(bool)
    enable_xray         = optional(bool)
    excluded_pages      = optional(list(string))
    favorite_pages      = optional(list(string))
    guest_role_arn      = optional(string)
    identity_pool_id    = optional(string)
    included_pages      = optional(list(string))
    session_sample_rate = optional(number)
    telemetries         = optional(list(string))
  }))
  default     = []
}
variable "rum_app_monitor_custom_events" {
  description = " (Optional) Specifies whether this app monitor allows the web client to define and send custom events. If you omit this parameter, custom events are DISABLED"
  type        = list(object({
    status = optional(string)
  }))
  default     = []
}
