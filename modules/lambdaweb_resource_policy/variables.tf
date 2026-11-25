variable "lambdaweb_resource_policy_policy" {
  description = "(Required) Resource-based IAM policy document as JSON. Terraform normalizes the document, so equivalent policies that differ only in key order or whitespace do not produce spurious diffs"
  type        = string
}
variable "lambdaweb_resource_policy_resource_arn" {
  description = "(Required) ARN of the Lambda Web function the policy is attached to. Must be a web function ARN (arn:aws:lambda:<region>:<account>:web-function/<name>). Changing this forces a new resource"
  type        = string
}
