variable "rds_cluster_activity_stream_resource_arn" {
  description = "ARN of the DB cluster"
  type        = string
}
variable "rds_cluster_activity_stream_mode" {
  description = "Specifies the mode of the database activity stream. Database events such as a change or access generate an activity stream event. The database session can handle these events either synchronously or asynchronously. One of: sync, async"
  type        = string
}
variable "rds_cluster_activity_stream_kms_key_id" {
  description = "The AWS KMS key identifier for encrypting messages in the database activity stream. The AWS KMS key identifier is the key ARN, key ID, alias ARN, or alias name for the KMS key"
  type        = string
}
variable "rds_cluster_activity_stream_engine_native_audit_fields_included" {
  description = "Specifies whether the database activity stream includes engine-native audit fields. This option only applies to an Oracle DB instance. By default, no engine-native audit fields are included. Defaults false"
  type        = bool
  default     = false
}
