variable "msk_scram_secret_association_cluster_arn" {
  description = "(Required, Forces new resource) ARN of the MSK cluster"
  type        = string
}
variable "msk_scram_secret_association_secret_arn_list" {
  description = "(Required) List of AWS Secrets Manager secret ARNs"
  type        = list(string)
}
