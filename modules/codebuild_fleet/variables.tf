variable "codebuild_fleet_base_capacity" {
  description = "(Required) Number of machines allocated to the ﬂeet"
  type        = number
}
variable "codebuild_fleet_compute_type" {
  description = "(Required) Compute resources the compute fleet uses"
  type        = string
}
variable "codebuild_fleet_environment_type" {
  description = "(Required) Environment type of the compute fleet"
  type        = string
}
variable "codebuild_fleet_fleet_service_role" {
  description = "(Optional) The service role associated with the compute fleet"
  type        = string
  default     = null
}
variable "codebuild_fleet_image_id" {
  description = "(Optional) AMI of the compute fleet"
  type        = string
  default     = null
}
variable "codebuild_fleet_name" {
  description = "(Required) Fleet name"
  type        = string
}
variable "codebuild_fleet_overflow_behavior" {
  description = "(Optional) Overflow behavior for compute fleet. Valid values: ON_DEMAND, QUEUE"
  type        = string
  default     = null
}
variable "codebuild_fleet_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "codebuild_fleet_compute_configuration" {
  description = "(Optional) The compute configuration of the compute fleet. This is only required if compute_type is set to ATTRIBUTE_BASED_COM
PUTE or CUSTOM_INSTANCE_TYPE"
  type        = list(object({
    disk          = optional(number)
    instance_type = optional(string)
    machine_type  = optional(string)
    memory        = optional(number)
    vcpu          = optional(number)
  }))
  default     = []
}
variable "codebuild_fleet_scaling_configuration" {
  description = "(Optional) Configuration block. This option is only valid when your overflow behavior is QUEUE"
  type        = list(object({
    max_capacity                    = optional(number)
    scaling_type                    = optional(string)
    target_tracking_scaling_configs = optional(list(object({
      metric_type  = optional(string)
      target_value = optional(number)
    })), [])
  }))
  default     = []
}
variable "codebuild_fleet_vpc_config" {
  description = "(Optional) Configuration block"
  type        = list(object({
    security_group_ids = list(string)
    subnets            = list(string)
    vpc_id             = string
  }))
  default     = []
}
