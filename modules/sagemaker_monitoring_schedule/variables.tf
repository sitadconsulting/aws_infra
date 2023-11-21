variable "sagemaker_monitoring_schedule_name" {
  description = "The name of the monitoring schedule. The name must be unique within an AWS Region within an AWS account. If omitted, Terraform will assign a random, unique name"
  type        = string
  default     = null
}
variable "sagemaker_monitoring_schedule_tags" {
  description = "A mapping of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "sagemaker_monitoring_schedule_monitoring_schedule_config" {
  description = "The configuration object that specifies the monitoring schedule and defines the monitoring job"
  type        = list(object({
    monitoring_job_definition_name = string
    monitoring_type                = string
    schedule_config                = optional(list(object({
      schedule_expression = string
    })), [])
  }))
}
