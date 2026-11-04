variable "appconfig_deployment_strategy_deployment_duration_in_minutes" {
  description = "(Required) Total amount of time for a deployment to last. Minimum value of 0, maximum value of 1440" 
  type        = number
}
variable "appconfig_deployment_strategy_description" {
  description = "(Optional) Description of the deployment strategy. Can be at most 1024 characters" 
  type        = string
  default     = null
}
variable "appconfig_deployment_strategy_final_bake_time_in_minutes" {
  description = "(Optional) Amount of time AWS AppConfig monitors for alarms before considering the deployment to be complete and no longer eligible for automatic roll back. Minimum value of 0, maximum value of 1440" 
  type        = number
  default     = null
}
variable "appconfig_deployment_strategy_growth_factor" {
  description = "(Required) Percentage of targets to receive a deployed configuration during each interval. Minimum value of 1.0, maximum value of 100.0" 
  type        = number
}
variable "appconfig_deployment_strategy_growth_type" {
  description = "(Optional) Algorithm used to define how percentage grows over time. Valid value: LINEAR and EXPONENTIAL. Defaults to LINEAR" 
  type        = string
  default     = null
}
variable "appconfig_deployment_strategy_name" {
  description = "(Required, Forces new resource) Name for the deployment strategy. Must be between 1 and 64 characters in length" 
  type        = string
}
variable "appconfig_deployment_strategy_replicate_to" {
  description = "(Required, Forces new resource) Where to save the deployment strategy. Valid values: NONE and SSM_DOCUMENT" 
  type        = string
}
variable "appconfig_deployment_strategy_tags" {
  description = "(Optional) Map of tags to assign to the resource" 
  type        = map(string)
  default     = {}
}
