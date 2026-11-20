variable "scheduler_schedule_group_name" {
  description = "(Optional, Forces new resource) Name of the schedule group. If omitted, Terraform will assign a random, unique name. Conflicts with name_prefix"
  type        = string
  default     = null
}
variable "scheduler_schedule_group_name_prefix" {
  description = "(Optional, Forces new resource) Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}
variable "scheduler_schedule_group_tags" {
  description = "(Optional) Key-value mapping of resource tags"
  type        = map(string)
  default     = {}
}
