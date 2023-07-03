variable "vpclattice_listener_rule_name" {
  description = "The name of the rule. The name must be unique within the listener"
  type        = string
}
variable "vpclattice_listener_rule_listener_identifier" {
  description = "The ID or Amazon Resource Name (ARN) of the listener"
  type        = string
}
variable "vpclattice_listener_rule_service_identifier" {
  description = "The ID or Amazon Resource Identifier (ARN) of the service"
  type        = string
}
variable "vpclattice_listener_rule_priority" {
  description = "The priority assigned to the rule. Each rule for a specific listener must have a unique priority. The lower the priority number the higher the priority"
  type        = number
  default     = null
}
variable "vpclattice_listener_rule_tags" {
  description = "Key-value mapping of resource tag"
  type        = map(string)
  default     = {}
}
variable "vpclattice_listener_rule_action" {
  description = "The action for the default rule"
  type        = list(object({
    fixed_response = optional(list(object({
      status_code  = number
    })))
    forward        = optional(list(object({
      target_groups = list(object({
        target_group_identifier = string
        weight                  = optional(number)
      }))
    }))) 
  }))
  default     = []
}
variable "vpclattice_listener_rule_match" {
  description = "The rule match"
  type        = list(object({
    http_match = optional(list(object({
      method  = optional(string)
      header_matches = optional(list(object({
        case_sensitive = bool
        name           = string
        match          = list(object({
          contains = optional(string)
          exact    = optional(string)
          prefix   = optional(string)
        }))
      })))
      path_match = optional(list(object({
        case_sensitive = bool
        match          = list(object({
          exact  = optional(string)
          prefix = optional(string)
        }))
      })))
    })))
  }))
  default     = []
}
