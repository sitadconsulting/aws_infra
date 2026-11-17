variable "docdb_cluster_allow_major_version_upgrade" {
  description = "(Optional) A value that indicates whether major version upgrades are allowed. Constraints: You must allow major version upgrades when specifying a value for the EngineVersion parameter that is a different major version than the DB cluster's current version"
  type        = bool
  default     = null
}
variable "docdb_cluster_apply_immediately" {
  description = "(Optional) Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. Default is false"
  type        = bool
  default     = false
}
variable "docdb_cluster_availability_zones" {
  description = "(Optional) A list of EC2 Availability Zones that instances in the DB cluster can be created in. DocumentDB automatically assigns 3 AZs if less than 3 AZs are configured, which will show as a difference requiring resource recreation next Terraform apply. We recommend specifying 3 AZs or using the lifecycle configuration block ignore_changes argument if necessary. At most 3 AZs can be configured. Note: Do not set availability_zones to the output of a data source such as aws_availability_zones, as this may be subject to change (for example, when a new AZ is added to a Region). Because changing availability_zones forces replacement, any change to the set of values will plan to destroy and recreate the cluster. Always use an explicit, static list of AZs"
  type        = list(string)
  default     = null
}
variable "docdb_cluster_backup_retention_period" {
  description = "(Optional) The days to retain backups for. Default 1"
  type        = number
  default     = null
}
variable "docdb_cluster_cluster_identifier_prefix" {
  description = "(Optional, Forces new resource) Creates a unique cluster identifier beginning with the specified prefix. Conflicts with cluster_identifier"
  type        = string
  default     = null
}
variable "docdb_cluster_cluster_identifier" {
  description = "(Optional, Forces new resources) The cluster identifier. If omitted, Terraform will assign a random, unique identifier"
  type        = string
  default     = null
}
variable "docdb_cluster_db_subnet_group_name" {
  description = "(Optional) A DB subnet group to associate with this DB instance"
  type        = string
  default     = null
}
variable "docdb_cluster_db_cluster_parameter_group_name" {
  description = "(Optional) A cluster parameter group to associate with the cluster"
  type        = string
  default     = null
}
variable "docdb_cluster_deletion_protection" {
  description = "(Optional) A boolean value that indicates whether the DB cluster has deletion protection enabled. The database can't be deleted when deletion protection is enabled. Defaults to false"
  type        = bool
  default     = true
}
variable "docdb_cluster_enabled_cloudwatch_logs_exports" {
  description = "(Optional) List of log types to export to CloudWatch. If omitted, no logs will be exported. The following log types are supported: audit, profiler"
  type        = list(string)
  default     = null
}
variable "docdb_cluster_engine_version" {
  description = "(Optional) The database engine version. Updating this argument results in an outage"
  type        = string
  default     = null
}
variable "docdb_cluster_engine" {
  description = "(Optional) The name of the database engine to be used for this DB cluster. Defaults to docdb. Valid values: docdb"
  type        = string
  default     = null
}
variable "docdb_cluster_final_snapshot_identifier" {
  description = "(Optional) The name of your final DB snapshot when this DB cluster is deleted. If omitted, no final snapshot will be made"
  type        = string
  default     = null
}
variable "docdb_cluster_global_cluster_identifier" {
  description = "(Optional) The global cluster identifier specified on aws_docdb_global_cluster"
  type        = string
  default     = null
}
variable "docdb_cluster_kms_key_id" {
  description = "(Optional) The ARN for the KMS encryption key. When specifying kms_key_id, storage_encrypted needs to be set to true"
  type        = string
  default     = null
}
variable "docdb_cluster_manage_master_user_password" {
  description = "(Optional) Set to true to allow Amazon DocumentDB to manage the master user password in AWS Secrets Manager. Cannot be set if master_password or master_password_wo is provided"
  type        = bool
  default     = null
}
variable "docdb_cluster_master_password" {
  description = "(Optional, required unless a snapshot_identifier or unless a global_cluster_identifier is provided when the cluster is the \"secondary\" cluster of a global database) Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. Please refer to the DocumentDB Naming Constraints. Conflicts with master_password_wo and manage_master_user_password"
  type        = string
  default     = null
}
variable "docdb_cluster_master_password_wo" {
  description = "(Optional, Write-Only, required unless a snapshot_identifier or unless a global_cluster_identifier is provided when the cluster is the \"secondary\" cluster of a global database) Password for the master DB user. Note that this will show up in logs. Please refer to the DocumentDB Naming Constraints. Conflicts with master_password and manage_master_user_password. If set, requires master_password_wo_version to be set."
  type        = string
  default     = null
}
variable "docdb_cluster_master_password_wo_version" {
  description = "(Optional) Required when master_password_wo is set. Changing this value triggers an update to master_password_wo"
  type        = string
  default     = null
}
variable "docdb_cluster_master_username" {
  description = "(Required unless a snapshot_identifier or unless a global_cluster_identifier is provided when the cluster is the "secondary" cluster of a global database) Username for the master DB user"
  type        = string
}
variable "docdb_cluster_network_type" {
  description = "(Optional) The network type of the DB cluster (IPV4 or DUAL)"
  type        = string
  default     = null
}
variable "docdb_cluster_port" {
  description = "(Optional) The port on which the DB accepts connections"
  type        = number
  default     = null
}
variable "docdb_cluster_preferred_backup_window" {
  description = "(Optional) The daily time range during which automated backups are created if automated backups are enabled using the BackupRetentionPeriod parameter.Time in UTC Default: A 30-minute window selected at random from an 8-hour block of time per regionE.g., 04:00-09:00"
  type        = string
  default     = null
}
variable "docdb_cluster_preferred_maintenance_window" {
  description = "(Optional) The weekly time range during which system maintenance can occur, in (UTC) e.g., wed:04:00-wed:04:30"
  type        = string
  default     = null
}
variable "docdb_cluster_skip_final_snapshot" {
  description = "(Optional) Determines whether a final DB snapshot is created before the DB cluster is deleted. If true is specified, no DB snapshot is created. If false is specified, a DB snapshot is created before the DB cluster is deleted, using the value from final_snapshot_identifier. Default is false"
  type        = bool
  default     = false
}
variable "docdb_cluster_snapshot_identifier" {
  description = "(Optional) Specifies whether or not to create this cluster from a snapshot. You can use either the name or ARN when specifying a DB cluster snapshot, or the ARN when specifying a DB snapshot. Automated snapshots should not be used for this attribute, unless from a different cluster. Automated snapshots are deleted as part of cluster destruction when the resource is replaced"
  type        = string
  default     = null
}
variable "docdb_cluster_storage_encrypted" {
  description = "(Optional) Specifies whether the DB cluster is encrypted. The default is false"
  type        = bool
  default     = null
}
variable "docdb_cluster_storage_type" {
  description = "(Optional) The storage type to associate with the DB cluster. Valid values: standard, iopt1"
  type        = string
  default     = null
}
variable "docdb_cluster_tags" {
  description = "(Optional) A map of tags to assign to the DB cluster"
  type        = map(string)
  default     = null
}
variable "docdb_cluster_vpc_security_group_ids" {
  description = "(Optional) List of VPC security groups to associate with the Cluster"
  type        =  list(string)
  default     = null
}
variable "docdb_cluster_restore_to_point_in_time" {
  description = "(Optional, Forces new resource) A configuration block for restoring a DB instance to an arbitrary point in time. Requires the identifier argument to be set with the name of the new DB instance to be created"
  type        = list(object({
    restore_to_time            = optional(string)
    restore_type               = optional(string)
    source_cluster_identifier  = string
    use_latest_restorable_time = optional(bool)
  }))
  default     = []
}
variable "docdb_cluster_serverless_v2_scaling_configuration" {
  description = "(Optional) Scaling configuration of an Amazon DocumentDB Serverless cluster"
  type        = list(object({
    max_capacity = number
    min_capacity = number
  }))
  default     = []
}
