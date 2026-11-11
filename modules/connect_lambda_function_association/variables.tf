variable "connect_lambda_function_association_function_arn" {
  description = "(Required) ARN of the Lambda Function, omitting any version or alias qualifier"
  type        = string
}
variable "connect_lambda_function_association_instance_id" {
  description = "(Required) The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance"
  type        = string
}
