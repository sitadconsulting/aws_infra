variable "glue_workflow_description" {
  description = "Description of the workflow"
  type        = string
  default     = ""
}
variable "glue_workflow_default_run_properties" {
  description = "A map of default run properties for this workflow. These properties are passed to all jobs associated to the workflow. "
  type        = map(string)
  default     = {}
}
variable "glue_workflow_max_concurrent_runs" {
  description = " Prevents exceeding the maximum number of concurrent runs of any of the component jobs. If you leave this parameter blank, there is no limit to the number of concurrent workflow runs"
  type        = number
  default     = null
}
variable "glue_workflow_name" {
  description = "The name you assign to this workflow"
  type        = string
}
variable "glue_workflow_tags" {
  description = "Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
