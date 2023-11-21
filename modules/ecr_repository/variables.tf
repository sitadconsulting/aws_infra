variable "ecr_repository_force_delete" {
  description = "If true, will delete the repository even if it contains images. Defaults to false"
  type        = bool
  default     = false
}
variable "ecr_repository_image_tag_mutability" {
  description = "The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE. Defaults to MUTABLE"
  type        = string
  default     = "MUTABLE"
}
variable "ecr_repository_name" {
  description = "Name of the repository"
  type        = string
}
variable "ecr_repository_tags" {
  description = "A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "ecr_repository_encryption_configuration" {
  description = "Encryption configuration for the repository"
  type        = list(object({
    encryption_type = optional(string)
    kms_key         = optional(string)
  }))
  default     = []
}
variable "ecr_repository_image_scanning_configuration" {
  description = "Configuration block that defines image scanning configuration for the repository. By default, image scanning must be manually triggered"
  type        = list(object({
    scan_on_push = bool
  }))
  default     = []
}
