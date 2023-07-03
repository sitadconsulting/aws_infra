variable "db_instance_allocated_storage" {
  description = "The allocated storage in gibibytes. If max_allocated_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs"
  type        = number
  default     = null
}
variable "db_instance_allow_major_version_upgrade" {
  description = "Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible"
  type        = bool
  default     = true
}
variable "db_instance_apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window. Default is false"
  type        = bool
  default     = false
}
variable "db_instance_auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. Defaults to true"
  type        = bool
  default     = true
}
variable "db_instance_availability_zone" {
  description = "The AZ for the RDS instance"
  type        = string
  default     = ""
}
variable "db_instance_backup_retention_period" {
  description = "The days to retain backups for. Must be between 0 and 35. Default is 0. Must be greater than 0 if the database is used as a source for a Read Replica, uses low-downtime updates, or will use RDS Blue/Green deployments"
  type        = number
  default     = 0
}
variable "db_instance_backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Example: "09:46-10:16". Must not overlap with maintenance_window"
  type        = string
  default     = ""
}
variable "db_instance_ca_cert_identifier" {
  description = "The identifier of the CA certificate for the DB instance"
  type        = string
  default     = ""
}
variable "db_instance_character_set_name" {
  description = "The character set name to use for DB encoding in Oracle and Microsoft SQL instances (collation). This can't be changed"
  type        = string
  default     = ""
}
variable "db_instance_copy_tags_to_snapshot" {
  description = "Copy all Instance tags to snapshots. Default is false"
  type        = bool
  default     = false
}
variable "db_instance_custom_iam_instance_profile" {
  description = "The instance profile associated with the underlying Amazon EC2 instance of an RDS Custom DB instance"
  type        = string
  default     = ""
}
variable "db_instance_db_name" {
  description = "The name of the database to create when the DB instance is created. If this parameter is not specified, no database is created in the DB instance. Note that this does not apply for Oracle or SQL Server engines"
  type        = string
  default     = ""
}
variable "db_instance_db_subnet_group_name" {
  description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available"
  type        = string
  default     = ""
}
variable "db_instance_delete_automated_backups" {
  description = "Specifies whether to remove automated backups immediately after the DB instance is deleted. Default is true"
  type        = bool
  default     = true
}
variable "db_instance_delete_protection" {
  description = "If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true. The default is false"
  type        = bool
  default     = false
}
variable "db_instance_domain" {
  description = "The ID of the Directory Service Active Directory domain to create the instance in"
  type        = string
  default     = ""
}
variable "db_instance_domain_iam_role_name" {
  description = "The name of the IAM role to be used when making API calls to the Directory Service"
  type        = string
  default     = ""
}
variable "db_instance_enabled_cloudwatch_logs_exports" {
  description = "Set of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine). MySQL and MariaDB: audit, error, general, slowquery. PostgreSQL: postgresql, upgrade. MSSQL: agent , error. Oracle: alert, audit, listener, trace. "
  type        = list(string)
  default     = []
}
variable "db_instance_engine" {
  description = "The database engine to use"
  type        = string
  default     = ""
}
variable "db_instance_engine_version" {
  description = "The engine version to use. If auto_minor_version_upgrade is enabled, you can provide a prefix of the version such as 5.7 (for 5.7.10)"
  type        = string
  default     = ""
}
variable "db_instance_final_snapshot_identifier" {
  description = "The name of your final DB snapshot when this DB instance is deleted. Must be provided if skip_final_snapshot is set to false. The value must begin with a letter, only contain alphanumeric characters and hyphens, and not end with a hyphen or contain two consecutive hyphens. Must not be provided when deleting a read replica"
  type        = string
  default     = ""
}
variable "db_instance_iam_database_authentication_enabled" {
  description = "Specifies whether mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled"
  type        = bool
  default     = true
}
variable "db_instance_identifier" {
  description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier. Required if restore_to_point_in_time is specified"
  type        = string
  default     = ""
}
variable "db_instance_identifier_prefix" {
  description = "Creates a unique identifier beginning with the specified prefix. Conflicts with identifier"
  type        = string
  default     = ""
}
variable "db_instance_instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
}
variable "db_instance_iops" {
  description = "The amount of provisioned IOPS. Setting this implies a storage_type of "io1". Can only be set when storage_type is "io1" or "gp3". Cannot be specified for gp3 storage if the allocated_storage value is below a per-engine threshold"
  type        = number
  default     = null
}
variable "db_instance_kms_key_id" {
  description = "The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN"
  type        = string
  default     = ""
}
variable "db_instance_license_model" {
  description = "License model information for this DB instance"
  type        = string
  default     = ""
}
variable "db_instance_maintenance_window" {
  description = "The window to perform maintenance in. Syntax: "ddd:hh24:mi-ddd:hh24:mi". Eg: "Mon:00:00-Mon:03:00""
  type        = string
  default     = ""
}
variable "db_instance_manage_master_user_password" {
  description = "Set to true to allow RDS to manage the master user password in Secrets Manager. Cannot be set if password is provided"
  type        = bool
  default     = true
}
variable "db_instance_master_user_secret_kms_key_id" {
  description = "The Amazon Web Services KMS key identifier is the key ARN, key ID, alias ARN, or alias name for the KMS key. To use a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN. If not specified, the default KMS key for your Amazon Web Services account is used"
  type        = string
  default     = ""
}
variable "db_instance_max_allocated_storage" {
  description = "When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated_storage. Must be greater than or equal to allocated_storage or 0 to disable Storage Autoscaling"
  type        = number
  default     = null
}
variable "db_instance_monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60"
  type        = number
  default     = 0
}
variable "db_instance_monitoring_role_arn" {
  description = "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs"
  type        = string
  default     = ""
}
variable "db_instance_multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = string
  default     = ""
}
variable "db_instance_name" {
  description = "The name of the database to create when the DB instance is created - Deprecated use db_name instead"
  type        = string
  default     = ""
}
variable "db_instance_nchar_character_set_name" {
  description = "The national character set is used in the NCHAR, NVARCHAR2, and NCLOB data types for Oracle instances. This can't be changed"
  type        = string
  default     = ""
}
variable "db_instance_network_type" {
  description = "The network type of the DB instance. Valid values: IPV4, DUAL"
  type        = string
  default     = ""
}
variable "db_instance_option_group_name" {
  description = "Name of the DB option group to associate"
  type        = string
  default     = ""
}
variable "db_instance_parameter_group_name" {
  description = "Name of the DB parameter group to associate"
  type        = string
  default     = ""
}
variable "db_instance_password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. Cannot be set if manage_master_user_password is set to true"
  type        = string
  default     = ""
}
variable "db_instance_performance_insights_enabled" {
  description = "Specifies whether Performance Insights are enabled. Defaults to false"
  type        = bool
  default     = false
}
variable "db_instance_performance_insights_kms_key_id" {
  description = "The ARN for the KMS key to encrypt Performance Insights data. When specifying performance_insights_kms_key_id, performance_insights_enabled needs to be set to true. Once KMS key is set, it can never be changed"
  type        = string
  default     = ""
}
variable "db_instance_performance_insights_retention_period" {
  description = "Amount of time in days to retain Performance Insights data. Valid values are 7, 731 (2 years) or a multiple of 31. When specifying performance_insights_retention_period, performance_insights_enabled needs to be set to true. Defaults to '7'"
  type        = number
  default     = 7
}
variable "db_instance_port" {
  description = "The port on which the DB accepts connections"
  type        = number
  default     = null
}
variable "db_instance_publicly_accessible" {
  description = "Whether instance should be publicly accessible. Default is false"
  type        = bool
  default     = false
}
variable "db_instance_replica_mode" {
  description = "Specifies whether the replica is in either mounted or open-read-only mode. This attribute is only supported by Oracle instances. Oracle replicas operate in open-read-only mode unless otherwise specified"
  type        = string
  default     = ""
}
variable "db_instance_replicate_source_db" {
  description = "Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate (if replicating within a single region) or ARN of the Amazon RDS Database to replicate (if replicating cross-region). Note that if you are creating a cross-region replica of an encrypted database you will also need to specify a kms_key_id"
  type        = string
  default     = ""
}
variable "db_instance_security_group_names" {
  description = "List of DB Security Groups to associate. Only used for DB Instances on the EC2-Classic Platform"
  type        = list(string)
  default     = []
}
variable "db_instance_skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier. Default is false"
  type        = bool
  default     = true
}
variable "db_instance_snapshot_identifier" {
  description = "Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console, e.g: rds:production-2015-06-26-06-05"
  type        = string
  default     = ""
}
variable "db_instance_storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted. Note that if you are creating a cross-region read replica this field is ignored and you should instead declare kms_key_id with a valid ARN. The default is false if not specified"
  type        = bool
  default     = false
}
variable "db_instance_storage_type" {
  description = "One of "standard" (magnetic), "gp2" (general purpose SSD), "gp3" (general purpose SSD that needs iops independently) or "io1" (provisioned IOPS SSD). The default is "io1" if iops is specified, "gp2" if not"
  type        = string
  default     = "io1"
}
variable "db_instance_storage_throughput" {
  description = "The storage throughput value for the DB instance. Can only be set when storage_type is "gp3". Cannot be specified if the allocated_storage value is below a per-engine threshold"
  type        = number
  default     = null
}
variable "db_instance_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "db_instance_timezone" {
  description = "Time zone of the DB instance. timezone is currently only supported by Microsoft SQL Server. The timezone can only be set on creation"
  type        = string
  default     = ""
}
variable "db_instance_username" {
  description = "Username for the master DB user. Cannot be specified for a replica - Required unless a snapshot_identifier or replicate_source_db is provided"
  type        = string
  default     = ""
}
variable "db_instance_vpc_security_group_ids" {
  description = "List of VPC security groups to associate"
  type        = list(string)
  default     = []
}
variable "db_instance_customer_owned_ip_enabled" {
  description = "Indicates whether to enable a customer-owned IP address (CoIP) for an RDS on Outposts DB instance"
  type        = bool
  default     = false
}
variable "db_instance_blue_green_update" {
  description = "Enables low-downtime updates using RDS Blue/Green deployments"
  type        = list(object({
    enabled   = optional(bool)
  }))
  default     = []
}
variable "db_instance_restore_to_point_in_time" {
  description = "A configuration block for restoring a DB instance to an arbitrary point in time. Requires the identifier argument to be set with the name of the new DB instance to be created"
  type        = list(object({
    restore_time                             = optional(string)
    source_db_instance_automated_backups_arn = optional(string)
    source_db_instance_identifier            = optional(string)
    source_dbi_resource_id                   = optional(string)
    use_latest_restorable_time               = optional(bool)
  }))
  default     = []
}
variable "db_instance_s3_import" {
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
