variable "codebuild_webhook_branch_filter" {
  description = "(Optional) A regular expression used to determine which branches get built. Default is all branches are built. We recommend using filter_group over branch_filter"
  type        = string
  default     = null
}
variable "codebuild_webhook_build_type" {
  description = "(Optional) The type of build this webhook will trigger. Valid values for this parameter are: BUILD, BUILD_BATCH"
  type        = string
  default     = null
}
variable "codebuild_webhook_manual_creation" {
  description = "(Optional) If true, CodeBuild doesn't create a webhook in GitHub and instead returns payload_url and secret values for the webhook. The payload_url and secret values in the output can be used to manually create a webhook within GitHub"
  type        = bool
  default     = false
}
variable "codebuild_webhook_project_name" {
  description = "(Required) The name of the build project"
  type        = string
}
variable "codebuild_webhook_codebuild_webhook" {
  description = "(Optional) Information about the webhook's trigger"
  type        = list(object({
    filter = list(object({
      type                    = string
      pattern                 = string
      exclude_matched_pattern = optional(bool)
    }))
  }))
  default     = []
}
variable "codebuild_webhook_scope_configuration" {
  description = "(Optional) Scope configuration for global or organization webhooks"
  type        = list(object({
    name   = string
    scope  = string
    domain = optional(string)
  }))
  default     = []
}
variable "codebuild_webhook_pull_request_build_policy" {
  description = "(Optional) Defines comment-based approval requirements for triggering builds on pull requests"
  type        = list(object({
    requires_comment_approval = string
    approver_roles            = optional(list(string))
  }))
  default     = []
}
