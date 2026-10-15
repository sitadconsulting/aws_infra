variable "msk_topic_configs" {
  description = "(Optional) Explicit configured Kafka configuration in JSON format for Topic"
  type        = string
  default     = null
}
variable "msk_topic_cluster_arn" {
  description = "(Required) ARN that uniquely identifies MSK Cluster"
  type        = string
}
variable "msk_topic_name" {
  description = "(Required) Name of Topic"
  type        = string
}
variable "msk_topic_partition_count" {
  description = "(Required) Number of partitions for Topic"
  type        = number
}
variable "msk_topic_replication_factor" {
  description = "(Required) Replication factor for Topic"
  type        = number
}
