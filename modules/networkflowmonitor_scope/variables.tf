variable "networkflowmonitor_scope_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "networkflowmonitor_scope_target" {
  description = "(Required) The targets to define the scope to be monitored. A target is an array of target resources, which are currently Region-account pairs"
  type        = list(object({
    region            = string
    target_identifier = list(object({
      target_type = string
      target_id   = list(object({
        account_id = string
      }))
    }))
  }))
}
