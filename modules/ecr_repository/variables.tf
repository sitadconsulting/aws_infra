variable "ecr_repository_force_delete" {
  description = "(Optional) If true, will delete the repository even if it contains images. Defaults to false"
  type        = bool
  default     = false
}
variable "ecr_repository_image_tag_mutability" {
  description = "(Optional) The tag mutability setting for the repository. Must be one of: MUTABLE, IMMUTABLE, IMMUTABLE_WITH_EXCLUSION, or MUTABLE_WITH_EXCLUSION. Defaults to MUTABLE"
  type        = string
  default     = "MUTABLE"
}
variable "ecr_repository_name" {
  description = "(Required) Name of the repository"
  type        = string
}
variable "ecr_repository_tags" {
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "ecr_repository_encryption_configuration" {
  description = "(Optional) Encryption configuration for the repository"
  type        = list(object({
    encryption_type = optional(string)
    kms_key         = optional(string)
  }))
  default     = []
}
variable "ecr_repository_image_scanning_configuration" {
  description = "(Optional) Configuration block that defines image scanning configuration for the repository. By default, image scanning must be manually triggered"
  type        = list(object({
    scan_on_push = bool
  }))
  default     = []
}
variable "ecr_repository_image_tag_mutability_exclusion_filter" {
  description = "(Optional) Configuration block that defines filters to specify which image tags can override the default tag mutability setting. Only applicable when image_tag_mutability is set to IMMUTABLE_WITH_EXCLUSION or MUTABLE_WITH_EXCLUSION"
  type        = list(object({
    filter      = string
    filter_type = string
  }))
  default     = []
}
