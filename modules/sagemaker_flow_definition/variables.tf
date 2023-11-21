variable "sagemaker_flow_definition_flow_definition_name" {
  description = "The name of your flow definition"
  type        = string
}
variable "sagemaker_flow_definition_role_arn" {
  description = "ARN of the role needed to call other services on your behalf"
  type        = string
}
variable "sagemaker_flow_definition_tags" {
  description = "A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "sagemaker_flow_definition_human_loop_activation_config" {
  description = "An object containing information about the events that trigger a human workflow"
  type        = list(object({
    human_loop_activation_conditions_config = optional(list(object({
      human_loop_activation_conditions = string
    })), [])
  }))
  default     = []
}
variable "sagemaker_flow_definition_human_loop_config" {
  description = "An object containing information about the tasks the human reviewers will perform"
  type        = list(object({
    human_task_ui_arn                     = string
    task_availability_lifetime_in_seconds = optional(number)
    task_count                            = number
    task_description                      = string
    task_keywords                         = optional(list(string))
    task_time_limit_in_seconds            = optional(number)
    task_title                            = string
    workteam_arn                          = string
    public_workforce_task_price = optional(list(object({
      amount_in_usd             = optional(list(object({
        cents                     = optional(number)
        dollars                   = optional(number)
        tenth_fractions_of_a_cent = optional(number)
      })), [])
    })), []) 
  }))
}
variable "sagemaker_flow_definition_human_loop_request_source" {
  description = "Container for configuring the source of human task requests. Use to specify if Amazon Rekognition or Amazon Textract is used as an integration source"
  type        = list(object({
    aws_managed_human_loop_request_source = string
  }))
  default     = []
}
variable "sagemaker_flow_definition_output_config" {
  description = "An object containing information about where the human review results will be uploaded"
  type        = list(object({
    kms_key_id     = optional(string)
    s3_output_path = string
  }))
}
