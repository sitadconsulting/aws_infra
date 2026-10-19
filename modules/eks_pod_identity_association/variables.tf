variable "eks_pod_identity_association_cluster_name" {
  description = "(Required) The name of the cluster to create the association in"
  type        = string
}
variable "eks_pod_identity_association_namespace" {
  description = "(Required) The name of the Kubernetes namespace inside the cluster to create the association in. The service account and the pods that use the service account must be in this namespace"
  type        = string
}
variable "eks_pod_identity_association_role_arn" {
  description = "(Required) ARN of the IAM role to associate with the service account. The EKS Pod Identity agent manages credentials to assume this role for applications in the containers in the pods that use this service account"
  type        = string
}
variable "eks_pod_identity_association_service_account" {
  description = "(Required) The name of the Kubernetes service account inside the cluster to associate the IAM credentials with"
  type        = string
}
variable "eks_pod_identity_association_disable_session_tags" {
  description = "(Optional) Disable the tags that are automatically added to role session by Amazon EKS. Must be set to true when policy is specified"
  type        = bool
  default     = false
}
variable "eks_pod_identity_association_policy" {
  description = "(Optional) An IAM policy in JSON format (as an escaped string) that applies additional restrictions to this Pod Identity association beyond the IAM policies attached to the IAM role. The effective permissions are the intersection of the role's policies and this policy, allowing you to enforce least privilege across multiple associations that share the same role. Requires disable_session_tags = true"
  type        = string
  default     = null
}
variable "eks_pod_identity_association_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "eks_pod_identity_association_target_role_arn" {
  description = "(Optional) ARN of the IAM role to be chained to the the IAM role specified as role_arn"
  type        = string
  default     = null
}
