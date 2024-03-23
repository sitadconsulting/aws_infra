variable "eks_access_entry_cluster_name" {
  description = "Name of the EKS Cluster"
  type        = string
}
variable "eks_access_entry_principal_arn" {
  description = "The IAM Principal ARN which requires Authentication access to the EKS cluster"
  type        = string
}
variable "eks_access_entry_kubernetes_groups" {
  description = "List of string which can optionally specify the Kubernetes groups the user would belong to when creating an access entry"
  type        = list(string) 
  default     = []
}
variable "eks_access_entry_tags" {
  description = "Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string) 
  default     = {} 
}
variable "eks_access_entry_type" {
  description = "Defaults to STANDARD which provides the standard workflow. EC2_LINUX, EC2_WINDOWS, FARGATE_LINUX types disallow users to input a username or groups, and prevent associations"
  type        = string
  default     = "STANDARD"
}
variable "eks_access_entry_user_name" {
  description = "Defaults to principal ARN if user is principal else defaults to assume-role/session-name is role is used"
  type        = string
  default     = ""
}
