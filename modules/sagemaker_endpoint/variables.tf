variable "sagemaker_endpoint_endpoint_config_name" {
  description = "The name of the endpoint configuration to use"
  type        = string
}
variable "sagemaker_endpoint_name" {
  description = "The name of the endpoint. If omitted, Terraform will assign a random, unique name"
  type        = string
  default     = null
}
variable "sagemaker_endpoint_tags" {
  description = "A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "sagemaker_endpoint_deployment_config" {
  description = "The deployment configuration for an endpoint, which contains the desired deployment strategy and rollback configurations"
  type        = list(object({
    auto_rollback_configuration = optional(list(object({
      alarms  = optional(list(object({
        alarm_name = string
      })), [])
    })), [])
    blue_green_update_policy    = optional(list(object({
      maximum_execution_timeout_in_seconds = optional(number)
      termination_wait_in_seconds          = optional(number)
      traffic_routing_configuration        = list(object({
        type                     = string
        wait_interval_in_seconds = number
        canary_size      = optional(list(object({
          type  = string
          value = number          
        })), [])
        linear_step_size = optional(list(object({
          type  = string
          value = number
        })), [])
      }))
    })), [])
    rolling_update_policy      = optional(list(object({
      maximum_execution_timeout_in_seconds = optional(number)
      wait_interval_in_seconds             = number
      maximum_batch_size = list(object({
        type  = string
        value = number
      }))
      rollback_maximum_batch_size = optional(list(object({
        type  = string
        value = number
      })), [])
    })), [])
  }))
  default     = []
}
