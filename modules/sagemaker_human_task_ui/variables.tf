variable "sagemaker_human_task_ui_human_task_ui_name" {
  description = "The name of the Human Task UI"
  type        = string
}
variable "sagemaker_human_task_ui_tags" {
  description = "A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "sagemaker_human_task_ui_ui_template" {
  description = "The Liquid template for the worker user interface"
  type        = list(object({
    content   = optional(string)
  }))
}
