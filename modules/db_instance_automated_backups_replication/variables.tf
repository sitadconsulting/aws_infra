variable "db_instance_automated_backups_replication_kms_key_id" {
  description = "The AWS KMS key identifier for encryption of the replicated automated backups. The KMS key ID is the Amazon Resource Name (ARN) for the KMS encryption key in the destination AWS Region, for example, arn:aws:kms:us-east-1:123456789012:key/AKIAIOSFODNN7EXAMPLE"
  type        = string
  default     = null
}
variable "db_instance_automated_backups_replication_pre_signed_url" {
  description = "A URL that contains a Signature Version 4 signed request for the StartDBInstanceAutomatedBackupsReplication action to be called in the AWS Region of the source DB instance"
  type        = string
  default     = null
}
variable "db_instance_automated_backups_replication_retention_period" {
  description = "The retention period for the replicated automated backups, defaults to 7"
  type        = number
  default     = 7
}
variable "db_instance_automated_backups_replication_source_db_instance_arn" {
  description = "The Amazon Resource Name (ARN) of the source DB instance for the replicated automated backups, for example, arn:aws:rds:us-west-2:123456789012:db:mydatabase"
  type        = string
}
