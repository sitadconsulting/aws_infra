variable "lambda_function_url_authorization_type" {
  description = "(Required) Type of authentication that the function URL uses. Valid values are AWS_IAM and NONE"
  type        = string
}
variable "lambda_function_url_function_name" {
  description = "(Required) Name or ARN of the Lambda function"
  type        = string
}
variable "lambda_function_url_invoke_mode" {
  description = "(Optional) How the Lambda function responds to an invocation. Valid values are BUFFERED (default) and RESPONSE_STREAM"
  type        = string 
  default     = null
}
variable "lambda_function_url_qualifier" {
  description = "(Optional) Alias name or $LATEST"
  type        = string
  default     = null
}
variable "lambda_function_url_cors" {
  description = "(Optional) Cross-origin resource sharing (CORS) settings for the function URL"
  type        = list(object({
    allow_credentials = optional(bool)
    allow_headers     = optional(list(string))
    allow_methods     = optional(list(string))
    allow_origins     = optional(list(string))
    expose_headers    = optional(list(string))
    max_age           = optional(number)
  }))
  default     = []
}
