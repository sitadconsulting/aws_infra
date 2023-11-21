variable "sagemaker_code_repository_code_repository_name" {
  description = "The name of the Code Repository (must be unique)"
  type        = string
}
variable "sagemaker_code_repository_code_repository_tags" {
  description = "A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "sagemaker_code_repository_git_config" {
  description = "Specifies details about the repository"
  type        = list(object({
    repository_url = string
    branch         = optional(string)
    secret_arn     = optional(string)
  }))
}
