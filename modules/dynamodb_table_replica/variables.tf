variable "dynamodb_table_replica_global_table_arn" {
  description = "ARN of the main or global table which this resource will replicate"
  type        = string
}
variable "dynamodb_table_replica_kms_key_arn" {
  description = "ARN of the CMK that should be used for the AWS KMS encryption. This argument should only be used if the key is different from the default KMS-managed DynamoDB key, alias/aws/dynamodb"
  type        = string
  default     = null
}
variable "dynamodb_table_replica_point_in_time_recovery" {
  description = "Whether to enable Point In Time Recovery for the replica. Default is false"
  type        = bool
  default     = false
}
variable "dynamodb_table_replica_table_class_override" {
  description = "Storage class of the table replica. Valid values are STANDARD and STANDARD_INFREQUENT_ACCESS. If not used, the table replica will use the same class as the global table"
  type        = string
  default     = null
}
variable "dynamodb_table_replica_tags" {
  description = "Map of tags to populate on the created table"
  type        = map(string)
  default     = {}
}
