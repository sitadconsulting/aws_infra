variable "codebuild_resource_policy_policy" {
  description = "(Required) A JSON-formatted resource policy. For more information"
  type        = string
}
variable "codebuild_resource_policy_resource_arn" {
  description = "(Required) The ARN of the Project or ReportGroup resource you want to associate with a resource policy"
  type        = string
}
