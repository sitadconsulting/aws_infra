variable "vpclattice_target_group_name" {
  description = "The name of the target group. The name must be unique within the account"
  type        = string
}
variable "vpclattice_target_group_type" {
  description = "The type of target group. Valid Values are IP | LAMBDA | INSTANCE | ALB"
  type        = string
}
variable "vpclattice_target_group_tags" {
  description = "Key-value mapping of resource tags"
  type        = map(string)
  default     = {}
}
variable "vpclattice_target_group_config" {
  description = "The target group configuration. If type is set to LAMBDA, this parameter should not be specified."
  type        = list(object({
    ip_address_type  = optional(string)
    port             = number
    protocol         = string
    protocol_version = optional(string)
    vpc_identifier   = string 
    health_check     = optional(list(object({
      enabled                       = bool
      health_check_interval_seconds = optional(number, 30)
      health_check_timeout_seconds  = optional(number, 5)
      healthy_threshold_count       = optional(number, 5)
      matcher                       = optional(list(object({
        value        = optional(string)
      })))
      path                      = optional(string)
      port                      = optional(number)
      protocol                  = optional(string)
      protocol_version          = optional(string) 
      unhealthy_threshold_count = optional(number)
    })))
  }))
  default     = []
}
