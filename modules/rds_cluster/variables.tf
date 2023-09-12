variable "rds_cluster_allocated_storage" {
  description = "The amount of storage in gibibytes (GiB) to allocate to each DB instance in the Multi-AZ DB cluster. (This setting is required to create a Multi-AZ DB cluster)"
  type        = number
  default     = null
}
variable "rds_cluster_allow_major_version_upgrade" {
  description = "Enable to allow major engine version upgrades when changing engine versions. Defaults to false "
  type        = bool
  default     = false
}
variable "rds_cluster_apply_immediately" {
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. Default is false"
  type        = bool
  default     = false
}
variable "rds_cluster_availability_zones" {
  description = "List of EC2 Availability Zones for the DB cluster storage where DB cluster instances can be created. RDS automatically assigns 3 AZs if less than 3 AZs are configured, which will show as a difference requiring resource recreation next Terraform apply"
  type        = list(string)
  default     = []
}
variable "rds_cluster_backtrack_window" {
  description = "The target backtrack window, in seconds. Only available for aurora and aurora-mysql engines currently. To disable backtracking, set this value to 0. Defaults to 0. Must be between 0 and 259200 (72 hours)"
  type        = number
  default     = 0
}
variable "rds_cluster_backup_retention_period" {
  description = "The days to retain backups for. Default 1"
  type        = number
  default     = 1
}
variable "rds_cluster_cluster_identifier_prefix" {
  description = "Creates a unique cluster identifier beginning with the specified prefix. Conflicts with cluster_identifier"
  type        = string
  default     = null
}
variable "rds_cluster_cluster_identifier" {
  description = "The cluster identifier. If omitted, Terraform will assign a random, unique identifier"
  type        = string
  default     = null
}
variable "rds_cluster_copy_tags_to_snapshot" {
  description = "Copy all Cluster tags to snapshots. Default is false"
  type        = bool
  default     = false
}
variable "rds_cluster_database_name" {
  description = "Name for an automatically created database on cluster creation"
  type        = string
  default     = null
}
variable "rds_cluster_db_cluster_parameter_group_name" {
  description = "A cluster parameter group to associate with the cluster"
  type        = string
  default     = null
}
variable "rds_cluster_db_instance_parameter_group_name" {
  description = "Instance parameter group to associate with all instances of the DB cluster. The db_instance_parameter_group_name parameter is only valid in combination with the allow_major_version_upgrade parameter"
  type        = string
  default     = null
}
variable "rds_cluster_db_subnet_group_name" {
  description = "A DB subnet group to associate with this DB instance. NOTE: This must match the db_subnet_group_name specified on every aws_rds_cluster_instance in the cluster"
  type        = string
  default     = null
}
variable "rds_cluster_enable_http_endpoint" {
  description = " Enable HTTP endpoint (data API). Only valid when engine_mode is set to serverless"
  type        = bool
  default     = false
}
variable "rds_cluster_enabled_cloudwatch_logs_exports" {
  description = "Set of log types to export to cloudwatch. If omitted, no logs will be exported. The following log types are supported: audit, error, general, slowquery, postgresql"
  type        = list(string)
  default     = []
}
variable "rds_cluster_engine" {
  description = "The name of the database engine to be used for this DB cluster. Defaults to aurora. Valid Values: aurora, aurora-mysql, aurora-postgresql, mysql, postgres. (Note that mysql and postgres are Multi-AZ RDS clusters)"
  type        = string
  default     = null
}
variable "rds_cluster_engine_mode" {
  description = "The database engine mode. Valid values: global (only valid for Aurora MySQL 1.21 and earlier), multimaster, parallelquery, provisioned, serverless. Defaults to: provisioned "
  type        = string
  default     = "provisioned"
}
variable "rds_cluster_engine_version" {
  description = "The database engine version. Updating this argument results in an outage"
  type        = string
  default     = null
}
variable "rds_cluster_db_cluster_instance_class" {
  description = "The compute and memory capacity of each DB instance in the Multi-AZ DB cluster, for example db.m6g.xlarge"
  type        = string
  default     = null
}
variable "rds_cluster_final_snapshot_identifier" {
  description = "The name of your final DB snapshot when this DB cluster is deleted. If omitted, no final snapshot will be made"
  type        = string
  default     = null
}
variable "rds_cluster_global_cluster_identifier" {
  description = "The global cluster identifier specified on aws_rds_global_cluster"
  type        = string
  default     = null
}
variable "rds_cluster_enable_global_write_forwarding" {
  description = "Whether cluster should forward writes to an associated global cluster. Applied to secondary clusters to enable them to forward writes to an aws_rds_global_cluster's primary cluster"
  type        = bool
  default     = false
}
variable "rds_cluster_iam_database_authentication_enabled" {
  description = "Specifies whether or not mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled"
  type        = bool
  default     = true
}
variable "rds_cluster_iam_roles" {
  description = "A List of ARNs for the IAM roles to associate to the RDS Cluster"
  type        = list(string)
  default     = []
}
variable "rds_cluster_kms_key_id" {
  description = "ARN for the KMS encryption key. When specifying kms_key_id, storage_encrypted needs to be set to true"
  type        = string
  default     = null
}
variable "rds_cluster_manage_master_user_password" {
  description = "Set to true to allow RDS to manage the master user password in Secrets Manager. Cannot be set if master_password is provided"
  type        = bool
  default     = null
}
variable "rds_cluster_master_user_secret_kms_key_id" {
  description = "The Amazon Web Services KMS key identifier is the key ARN, key ID, alias ARN, or alias name for the KMS key"
  type        = string
  default     = null
}
variable "rds_cluster_master_password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file - Cannot be set if manage_master_user_password is set to true"
  type        = string
  default     = null
}
variable "rds_cluster_master_username" {
  description = "Username for the master DB user - This argument does not support in-place updates and cannot be changed during a restore from snapshot"
  type        = string
  default     = null
}
variable "rds_cluster_port" {
  description = "The port on which the DB accepts connections"
  type        = number
  default     = null
}
variable "rds_cluster_preferred_backup_window" {
  description = "The daily time range during which automated backups are created if automated backups are enabled using the BackupRetentionPeriod parameter.Time in UTC. Default: A 30-minute window selected at random from an 8-hour block of time per regionE.g., 04:00-09:00"
  type        = string
  default     = null
}
variable "rds_cluster_preferred_maintenance_window" {
  description = "The weekly time range during which system maintenance can occur, in (UTC) e.g., wed:04:00-wed:04:30"
  type        = string
  default     = null
}
variable "rds_cluster_replication_source_identifier" {
  description = "ARN of a source DB cluster or DB instance if this DB cluster is to be created as a Read Replica"
  type        = string
  default     = null
}
variable "rds_cluster_network_type" {
  description = "The network type of the cluster. Valid values: IPV4, DUAL"
  type        = string
  default     = "IPV4"
}
variable "rds_cluster_skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB cluster is deleted. If true is specified, no DB snapshot is created. If false is specified, a DB snapshot is created before the DB cluster is deleted, using the value from final_snapshot_identifier. Default is false"
  type        = bool
  default     = true
}
variable "rds_cluster_snapshot_identifier" {
  description = "Specifies whether or not to create this cluster from a snapshot. You can use either the name or ARN when specifying a DB cluster snapshot, or the ARN when specifying a DB snapshot"
  type        = string
  default     = null
}
variable "rds_cluster_source_region" {
  description = "The source region for an encrypted replica DB cluster"
  type        = string
  default     = null
}
variable "rds_cluster_storage_type" {
  description = "Specifies the storage type to be associated with the DB cluster. (This setting is required to create a Multi-AZ DB cluster). Valid values: io1, Default: io1"
  type        = string
  default     = null
}
variable "rds_cluster_iops" {
  description = "The amount of Provisioned IOPS (input/output operations per second) to be initially allocated for each DB instance in the Multi-AZ DB cluster"
  type        = number
  default     = null
}
variable "rds_cluster_storage_encrypted" {
  description = "Specifies whether the DB cluster is encrypted. The default is false for provisioned engine_mode and true for serverless engine_mode. When restoring an unencrypted snapshot_identifier, the kms_key_id argument must be provided to encrypt the restored cluster"
  type        = bool
  default     = false
}
variable "rds_cluster_tags" {
  description = "A map of tags to assign to the DB cluster"
  type        = map(string)
  default     = {}
}
variable "rds_cluster_vpc_security_group_ids" {
  description = "List of VPC security groups to associate with the Cluster"
  type        = list(string)
  default     = []

}
variable "rds_cluster_restore_to_point_in_time" {
  description = "Configuration for restoring a DB Cluster to an arbitrary point in time"
  type        = list(object({
    restore_to_time            = optional(string)
    restore_type               = optional(string)
    source_cluster_identifier  = string
    use_latest_restorable_time = optional(bool)
  }))
  default     = []

}
variable "rds_cluster_s3_import" {
  description = "Restore from a Percona Xtrabackup in S3"
  type        = list(object({
    bucket_name           = string
    bucket_prefix         = optional(string)
    ingestion_role        = string
    source_engine         = string
    source_engine_version = string  
  }))
  default     = []

}
variable "rds_cluster_scaling_configuration" {
  description = "Scaling configuation for a serverless DB Cluster"
  type        = list(object({
    auto_pause               = optional(bool)
    max_capacity             = optional(number)
    min_capacity             = optional(number)
    seconds_until_auto_pause = optional(number)
    timeout_action           = optional(string)
  }))
  default     = []

}
variable "rds_cluster_serverlessv2_scaling_configuration" {
  description = "Scaling configuration for a serverless V2 DB Cluster"
  type        = list(object({
    max_capacity = number 
    min_capacity = number
  }))
  default     = []
}
