variable "redshift_cluster_iam_roles_cluster_identifier" {
  description = "The name of the Redshift Cluster IAM Roles"
  type        = string
}
variable "redshift_cluster_iam_roles_iam_role_arns" {
  description = "A list of IAM Role ARNs to associate with the cluster. A Maximum of 10 can be associated to the cluster at any time"
  type        = list(string)
  default     = []
}
variable "redshift_cluster_iam_roles_default_iam_role_arn" {
  description = "ARN of the IAM role that was set as default for the cluster when the cluster was created"
  type        = string
  default     = ""
}
