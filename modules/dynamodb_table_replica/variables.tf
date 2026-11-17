variable "dynamodb_table_replica_deletion_protection_enabled" {
  description = "(Optional) Whether deletion protection is enabled (true) or disabled (false) on the table replica"
  type        = bool
  default     = false
}
variable "dynamodb_table_replica_global_table_arn" {
  description = "(Required) ARN of the main or global table which this resource will replicate"
  type        = string
}
variable "dynamodb_table_replica_kms_key_arn" {
  description = "(Optional, Forces new resource) ARN of the CMK that should be used for the AWS KMS encryption. This argument should only be used if the key is different from the default KMS-managed DynamoDB key, alias/aws/dynamodb. Note: This attribute will not be populated with the ARN of default keys"
  type        = string
  default     = null
}
variable "dynamodb_table_replica_point_in_time_recovery" {
  description = "(Optional) Whether to enable Point In Time Recovery for the table replica. Default is false"
  type        = bool
  default     = false
}
variable "dynamodb_table_replica_table_class_override" {
  description = "(Optional, Forces new resource) Storage class of the table replica. Valid values are STANDARD and STANDARD_INFREQUENT_ACCESS. If not used, the table replica will use the same class as the global table"
  type        = string
  default     = null
}
variable "dynamodb_table_replica_tags" {
  description = "(Optional) Map of tags to populate on the created table"
  type        = map(string)
  default     = {}
}
