variable "lambda_function_url_authorization_type" {
  description = "The type of authentication that the function URL uses. Set to \"AWS_IAM\" to restrict access to authenticated IAM users only. Set to \"NONE\" to bypass IAM authentication and create a public endpoint"
  type        = string
}
variable "lambda_function_url_function_name" {
  description = "ARN of the Lambda function"
  type        = string
}
variable "lambda_function_url_invoke_mode" {
  description = "Determines how the Lambda function responds to an invocation. Valid values are BUFFERED (default) and RESPONSE_STREAM"
  type        = string 
  default     = null
}
variable "lambda_function_url_qualifier" {
  description = "The alias name or \"$LATEST\""
  type        = string
  default     = null
}
variable "lambda_function_url_cors" {
  description = "The cross-origin resource sharing (CORS) settings for the function URL"
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
