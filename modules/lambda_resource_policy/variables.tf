variable "lambda_resource_policy_policy" {
  description = "(Required) JSON-formatted resource-based policy document to attach to the Lambda resource. This replaces the entire policy on the resource. Maximum 20,480 characters"
  type        = string
}
variable "lambda_resource_policy_resource_arn" {
  description = "(Required, Forces new resource) ARN of the Lambda function, function version, or function alias to attach the policy to. Can be a qualified or unqualified ARN"
  type        = string
}
