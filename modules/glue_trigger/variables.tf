variable "glue_trigger_description" {
  description = "A description of the new trigger"
  type        = string
  default     = ""
} 
variable "glue_trigger_enabled" {
  description = "Start the trigger. Defaults to true"
  type        = bool
  default     = false
}
variable "glue_trigger_name" {
  description = "The name of the trigger"
  type        = string
}
variable "glue_trigger_schedule" {
  description = "A cron expression used to specify the schedule"
  type        = string
  default     = ""
}
variable "glue_trigger_start_on_creation" {
  description = "Set to true to start SCHEDULED and CONDITIONAL triggers when created. True is not supported for ON_DEMAND triggers"
  type        = bool
  default     = false
}
variable "glue_trigger_tags" {
  description = "Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "glue_trigger_type" {
  description = " The type of trigger. Valid values are CONDITIONAL, EVENT, ON_DEMAND, and SCHEDULED"
  type        = string
}
variable "glue_trigger_workflow_name" {
  description = "A workflow to which the trigger should be associated to. Every workflow graph (DAG) needs a starting trigger (ON_DEMAND or SCHEDULED type) and can contain multiple additional CONDITIONAL triggers"
  type        = string
  default     = ""
}
variable "glue_trigger_actions" {
  description = "List of actions initiated by this trigger when it fires"
  type        = list(object({
    arguments              = optional(map(string))
    crawler_name           = optional(string)
    job_name               = optional(string)
    timeout                = optional(number)
    security_configuration = optional(string)
    notification_property = optional(list(object({
      notify_delay_after = optional(number)
    })))
  }))
}
variable "glue_trigger_event_batching_condition" {
  description = "Batch condition that must be met (specified number of events received or batch time window expired) before EventBridge event trigger fires"
  type        = list(object({
    batch_size   = number
    batch_window = optional(number)
  }))
  default     = []
}
variable "glue_trigger_predicate" {
  description = "A predicate to specify when the new trigger should fire. Required when trigger type is CONDITIONAL"
  type        = list(object({
    logical    = optional(string)
    conditions = list(object({
      crawler_name     = optional(string)
      crawler_state    = optional(string)
      job_name         = optional(string)
      logical_operator = optional(string)
      state            = optional(string)
    })) 
  }))
  default     = []
}
