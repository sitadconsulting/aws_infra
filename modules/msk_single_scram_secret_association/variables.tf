variable "msk_single_scram_secret_association_cluster_arn" {
  description = "(Required, Forces new resource) ARN of the MSK cluster"
  type        = string
}
variable "msk_single_scram_secret_association_secret_arn" {
  description = "(Required, Forces new resource) AWS Secrets Manager secret ARN"
  type        = string
}
