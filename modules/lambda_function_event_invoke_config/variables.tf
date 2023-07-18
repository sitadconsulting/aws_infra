variable "lambda_function_event_invoke_config_function_name" {
  description = "ARN of the Lambda Function, omitting any version or alias qualifier"
  type        = string
}
variable "lambda_function_event_invoke_config_maximum_event_age_in_seconds" {
  description = "Maximum age of a request that Lambda sends to a function for processing in seconds. Valid values between 60 and 21600"
  type        = number
  default     = null
}
variable "lambda_function_event_invoke_config_maximum_retry_attempts" {
  description = "Maximum number of times to retry when the function returns an error. Valid values between 0 and 2. Defaults to 2"
  type        = number
  default     = 2
}
variable "lambda_function_event_invoke_config_qualifier" {
  description = "Lambda Function published version, $LATEST, or Lambda Alias name"
  type        = string
  default     = null
}
variable "lambda_function_event_invoke_config_destination_config" {
  description = "A destination for events after they have been sent to a function for processing"
  type        = list(object({
    on_failure = optional(list(object({
      destination = string
    })), [])
    on_success = optional(list(object({
      destination = string
    })), [])
  }))
  default     = []
}
