variable "rds_cluster_instance_apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window. Default isfalse"
  type        = bool
  default     = false
}
variable "rds_cluster_instance_auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. Default true"
  type        = bool
  default     = true
}
variable "rds_cluster_instance_availability_zone" {
  description = "The EC2 Availability Zone that the DB instance is created in"
  type        = string
  default     = ""
}
variable "rds_cluster_instance_ca_cert_identifier" {
  description = "The identifier of the CA certificate for the DB instance"
  type        = string
  default     = ""
}
variable "rds_cluster_instance_cluster_identifier" {
  description = "The identifier of the aws_rds_cluster in which to launch this instance"
  type        = string
}
variable "rds_cluster_instance_copy_tags_to_snapshot" {
  description = "Indicates whether to copy all of the user-defined tags from the DB instance to snapshots of the DB instance. Default false"
  type        = bool
  default     = false
}
variable "rds_cluster_instance_db_parameter_group_name" {
  description = "The name of the DB parameter group to associate with this instance"
  type        = string
  default     = ""
}
variable "rds_cluster_instance_db_subnet_group_name" {
  description = "A DB subnet group to associate with this DB instance. NOTE: This must match the db_subnet_group_name of the attached aws_rds_cluster"
  type        = string
  default     = ""
}
variable "rds_cluster_instance_engine" {
  description = "The name of the database engine to be used for the RDS instance. Defaults to aurora. Valid Values: aurora, aurora-mysql, aurora-postgresql"
  type        = string
  default     = ""
}
variable "rds_cluster_instance_engine_version" {
  description = "The database engine version"
  type        = string
  default     = ""
}
variable "rds_cluster_instance_identifier" {
  description = "The identifier for the RDS"
  type        = string
  default     = ""
}
variable "rds_cluster_instance_identifier_prefix" {
  description = "Creates a unique identifier beginning with the specified prefix. Conflicts with identifier"
  type        = string
  default     = ""
}
variable "rds_cluster_instance_instance_class" {
  description = "The instance class to use. For details on CPU and memory, see Scaling Aurora DB Instances. Aurora uses db.* instance classes/types"
  type        = string
}
variable "rds_cluster_instance_monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60"
  type        = number
  default     = null
}
variable "rds_cluster_instance_monitoring_role_arn" {
  description = "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs"
  type        = string
  default     = ""
}
variable "rds_cluster_instance_performance_insights_enabled" {
  description = "Specifies whether Performance Insights is enabled or not"
  type        = bool
  default     = false
}
variable "rds_cluster_instance_performance_insights_kms_key_id" {
  description = "ARN for the KMS key to encrypt Performance Insights data. When specifying performance_insights_kms_key_id, performance_insights_enabled needs to be set to true"
  type        = string
  default     = ""
}
variable "rds_cluster_instance_performance_insights_retention_period" {
  description = "Amount of time in days to retain Performance Insights data. Valid values are 7, 731 (2 years) or a multiple of 31. When specifying performance_insights_retention_period, performance_insights_enabled needs to be set to true. Defaults to '7 "
  type        = number
  default     = 7
}
variable "rds_cluster_instance_preferred_backup_window" {
  description = "The daily time range during which automated backups are created if automated backups are enabled. Eg: \"04:00-09:00\". NOTE: If preferred_backup_window is set at the cluster level, this argument must be omitted. "
  type        = string
  default     = ""
}
variable "rds_cluster_instance_preferred_maintenance_window" {
  description = "The window to perform maintenance in. Syntax: \"ddd:hh24:mi-ddd:hh24:mi\". Eg: \"Mon:00:00-Mon:03:00\""
  type        = string
  default     = ""
}
variable "rds_cluster_instance_publicly_accessible" {
  description = "Whether instance is publicly accessible. Default false"
  type        = bool
  default     = false
}
variable "rds_cluster_instance_promotion_tier" {
  description = "Failover Priority setting at instance level. The reader who has lower tier has higher priority to get promoted to writer. Default: Writer "
  type        = string
  default     = ""
}
variable "rds_cluster_instance_tags" {
  description = "A map of tags to assign to the instance"
  type        = map(string)
  default     = {}
}
