variable "secret_rotation_secret_id" {
  description = "Specifies the secret to which you want to add a new version. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret"
  type        = string
}
variable "secret_rotation_rotation_lambda_arn" {
  description = "Specifies the ARN of the Lambda function that can rotate the secret"
  type        = string
}
variable "secret_rotation_rotation_rules" {
  description = "A structure that defines the rotation configuration for this secret"
  type        = list(object({
    automatically_after_days = number
  }))
  default  = []
}
