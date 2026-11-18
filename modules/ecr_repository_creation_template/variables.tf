variable "ecr_repository_creation_template_applied_for" {
  description = "(Required) Which features this template applies to. Must contain one or more of CREATE_ON_PUSH, PULL_THROUGH_CACHE, or REPLICATION"
  type        = string
}
variable "ecr_repository_creation_template_custom_role_arn" {
  description = "(Optional) A custom IAM role to use for repository creation. Required if using repository tags or KMS encryption"
  type        = string
  default     = null
}
variable "ecr_repository_creation_template_description" {
  description = "(Optional) The description for this template"
  type        = string
  default     = null
}
variable "ecr_repository_creation_template_image_tag_mutability" {
  description = " (Optional) The tag mutability setting for any created repositories. Must be one of: MUTABLE, IMMUTABLE, IMMUTABLE_WITH_EXCLUSION, or MUTABLE_WITH_EXCLUSION. Defaults to MUTABLE"
  type        = string
  default     = "MUTABLE"
}
variable "ecr_repository_creation_template_lifecycle_policy" {
  description = "(Optional) The lifecycle policy document to apply to any created repositories. Consider using the aws_ecr_lifecycle_policy_document data_source to generate/manage the JSON document used for the lifecycle_policy argument"
  type        = string
  default     = null
}
variable "ecr_repository_creation_template_prefix" {
  description = "(Required, Forces new resource) The repository name prefix to match against. Use ROOT to match any prefix that doesn't explicitly match another template"
  type        = string
}
variable "ecr_repository_creation_template_repository_policy" {
  description = "(Optional) The registry policy document to apply to any created repositories. This is a JSON formatted string"
  type        = string
  default     = null
}
variable "ecr_repository_creation_template_resource_tags" {
  description = "(Optional) A map of tags to assign to any created repositories"
  type        = map(string)
  default     = {}
}
variable "ecr_repository_creation_template_encryption_configuration" {
  description = "(Optional) Encryption configuration for any created repositories"
  type        = list(object({
    encryption_type = optional(string)
    kms_key         = optional(string)
  }))
  default     = []
}
variable "ecr_repository_creation_template_image_tag_mutability_exclusion_filter" {
  description = "(Optional) Configuration block that defines filters to specify which image tags can override the default tag mutability setting. Only applicable when image_tag_mutability is set to IMMUTABLE_WITH_EXCLUSION or MUTABLE_WITH_EXCLUSION"
  type        = list(object({
    filter      = string
    filter_type = string
  }))
  default     = []
}
