variable "msk_cluster_policy_cluster_arn" {
  description = "(Required) ARN that uniquely identifies the cluster"
  type        = string
}
variable "msk_cluster_policy_policy" {
  description = "(Required) Resource policy for cluster"
  type        = string
}
