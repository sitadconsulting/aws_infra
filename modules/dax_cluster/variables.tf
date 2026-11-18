variable "dax_cluster_cluster_endpoint_encryption_type" {
  description = "(Optional) The type of encryption the cluster's endpoint should support. Valid values are: NONE and TLS. Default value is NONE"
  type        = string
  default     = null
}
variable "dax_cluster_cluster_name" {
  description = "(Required) Group identifier. DAX converts this name to lowercase"
  type        = string
}
variable "dax_cluster_iam_role_arn" {
  description = "(Required) Valid ARN that identifies an IAM role. At runtime, DAX will assume this role and use the role's permissions to access DynamoDB on your behalf"
  type        = string
}
variable "dax_cluster_node_type" {
  description = "(Required) The compute and memory capacity of the nodes"
  type        = string
}
variable "dax_cluster_replication_factor" {
  description = "(Required) The number of nodes in the DAX cluster. A replication factor of 1 will create a single-node cluster, without any read replicas"
  type        = number
  default     = null
}
variable "dax_cluster_availability_zones" {
  description = "(Optional) List of Availability Zones in which the nodes will be created"
  type        = list(string)
  default     = null
}
variable "dax_cluster_description" {
  description = "(Optional) Description for the cluster"
  type        = string
  default     = null
}
variable "dax_cluster_notification_topic_arn" {
  description = "(Optional) ARN of an SNS topic to send DAX notifications to. Example: arn:aws:sns:us-east-1:012345678999:my_sns_topic"
  type        = string
  default     = null
}
variable "dax_cluster_parameter_group_name" {
  description = "(Optional) Name of the parameter group to associate with this DAX cluster"
  type        = string
  default     = null
}
variable "dax_cluster_maintenance_window" {
  description = "(Optional) Specifies the weekly time range for when maintenance on the cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Example: sun:05:00-sun:09:00"
  type        = string
  default     = null
}
variable "dax_cluster_security_group_ids" {
  description = "(Optional) One or more VPC security groups associated with the cluster"
  type        = list(string)
  default     = null
}
variable "dax_cluster_subnet_group_name" {
  description = "(Optional) Name of the subnet group to be used for the cluster"
  type        = string
  default     = null
}
variable "dax_cluster_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "dax_cluster_server_side_encryption" {
  description = "(Optional) Encrypt at rest options"
  type        = list(object({
    enabled = bool
  }))
  default     = []
}

