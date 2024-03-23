variable "eks_addon_addon_name" {
  description = "Name of the EKS add-on. The name must match one of the names returned by describe-addon-versions"
  type        = string
}
variable "eks_addon_addon_version" {
  description = "The version of the EKS add-on. The version must match one of the versions returned by describe-addon-versions"
  type        = string
  default     = ""
}
variable "eks_addon_cluster_name" {
  description = "Name of the EKS Cluster"
  type        = string
}
variable "eks_addon_configuration_values" {
  description = "Custom configuration values for addons with single JSON string. This JSON string value must match the JSON schema derived from describe-addon-configuration"
  type        = string
  default     = ""
}
variable "eks_addon_resolve_conflicts_on_create" {
  description = "How to resolve field value conflicts when migrating a self-managed add-on to an Amazon EKS add-on. Valid values are NONE and OVERWRITE. For more details see the CreateAddon API Docs"
  type        = string
  default     = null
}
variable "eks_addon_resolve_conflicts_on_update" {
  description = "How to resolve field value conflicts for an Amazon EKS add-on if you've changed a value from the Amazon EKS default value. Valid values are NONE, OVERWRITE, and PRESERVE. For more details see the UpdateAddon API Docs"
  type        = string
  default     = null
}
variable "eks_addon_tags" {
  description = "Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "eks_addon_preserve" {
  description = "Indicates if you want to preserve the created resources when deleting the EKS add-on"
  type        = bool
  default     = false
}
variable "eks_addon_service_account_role_arn" {
  description = "The Amazon Resource Name (ARN) of an existing IAM role to bind to the add-on's service account. The role must be assigned the IAM permissions required by the add-on. If you don't specify an existing IAM role, then the add-on uses the permissions assigned to the node IAM role"
  type        = string
  default     = null
}
