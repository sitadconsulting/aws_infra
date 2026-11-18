variable "ecr_pull_through_cache_rule_credential_arn" {
  description = "(Optional) ARN of the Secret which will be used to authenticate against the registry"
  type        = string
  default     = null
}
variable "ecr_pull_through_cache_rule_custom_role_arn" {
  description = "(Optional) The ARN of the IAM role associated with the pull through cache rule. Must be specified if the upstream registry is a cross-account ECR private registry"
  type        = string
  default     = null
}
variable "ecr_pull_through_cache_rule_ecr_repository_prefix" {
  description = "(Required, Forces new resource) The repository name prefix to use when caching images from the source registry. Use ROOT as the prefix to apply a template to all repositories in your registry that don't have an associated pull through cache rule"
  type        = string
}
variable "ecr_pull_through_cache_rule_upstream_registry_url" {
  description = "(Required, Forces new resource) The registry URL of the upstream registry to use as the source"
  type        = string
}
variable "ecr_pull_through_cache_rule_upstream_repository_prefix" {
  description = "(Optional, Forces new resource) The upstream repository prefix associated with the pull through cache rule. Used if the upstream registry is an ECR private registry. If not specified, it's set to ROOT, which allows matching with any upstream repository"
  type        = string
  default     = null
}
