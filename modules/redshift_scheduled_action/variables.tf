variable "redshift_scheduled_action_description" {
  description = "The description of the scheduled action"
  type        = string
  default     = ""
}
variable "redshift_scheduled_action_enabled" {
  description = "Whether to enable the scheduled action. Default is true"
  type        = bool
  default     = false
}
variable "redshift_scheduled_action_end_time" {
  description = "The end time in UTC when the schedule is active, in UTC RFC3339 format(for example, YYYY-MM-DDTHH:MM:SSZ)"
  type        = string
  default     = ""
}
variable "redshift_scheduled_action_name" {
  description = "The scheduled action name"
  type        = string
}
variable "redshift_scheduled_action_iam_role" {
  description = "The IAM role to assume to run the scheduled action"
  type        = string
}
variable "redshift_scheduled_action_schedule" {
  description = "The schedule of action. The schedule is defined format of \"at expression\" or \"cron expression\", for example at(2016-03-04T17:27:00) or cron(0 10 ? * MON *)"
  type        = string
}
variable "redshift_scheduled_action_start_time" {
  description = "The start time in UTC when the schedule is active, in UTC RFC3339 format(for example, YYYY-MM-DDTHH:MM:SSZ)"
  type        = string
  default     = ""
}
variable "redshift_scheduled_action_target_action" {
  description = "Target action"
  type        = list(object({
    pause_cluster = optional(list(object({
      cluster_identifier = string
    })), [])
    resize_cluster = optional(list(object({
      classic            = optional(bool)
      cluster_identifier = string
      cluster_type       = optional(string)
      node_type          = optional(string)
      number_of_nodes    = optional(number)  
    })), [])
    resume_cluster = optional(list(object({
      cluster_identifier = string
    })), [])
  }))
  default     = []
}
