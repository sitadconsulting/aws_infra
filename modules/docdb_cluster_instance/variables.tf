variable "docdb_cluster_instance_apply_immediately" {
  description = "(Optional) Whether any database modifications are applied immediately, or during the next maintenance window. Default is false"
  type        = bool
  default     = false
}
variable "docdb_cluster_instance_auto_minor_version_upgrade" {
  description = "Optional) Parameter does not apply to Amazon DocumentDB. Amazon DocumentDB does not perform minor version upgrades regardless of the value set (see docs). Default true"
  type        = bool
  default     = false
}
variable "docdb_cluster_instance_availability_zone" {
  description = "(Optional, Computed) EC2 Availability Zone that the DB instance is created in"
  type        = string
  default     = null
}
variable "docdb_cluster_instance_ca_cert_identifier" {
  description = "(Optional) Identifier of the certificate authority (CA) certificate for the DB instance"
  type        = string
  default     = null
}
variable "docdb_cluster_instance_certificate_rotation_restart" {
  description = "(Optional) Whether to restart the DB instance when rotating its SSL/TLS certificate. By default, AWS restarts the DB instance when you rotate your SSL/TLS certificate. The certificate is not updated until the DB instance is restarted. Set to false only if you are not using SSL/TLS to connect to the DB instance"
  type        = bool
  default     = null
}
variable "docdb_cluster_instance_cluster_identifier" {
  description = "(Required) Identifier of the aws_docdb_cluster in which to launch this instance"
  type        = string
}
variable "docdb_cluster_instance_copy_tags_to_snapshot" {
  description = "(Optional, boolean) Copy all DB instance tags to snapshots. Default is false"
  type        = bool
  default     = false
}
variable "docdb_cluster_instance_enable_performance_insights" {
  description = "(Optional) Value that indicates whether to enable Performance Insights for the DB Instance. Default false"
  type        = bool
  default     = false
}
variable "docdb_cluster_instance_engine" {
  description = "(Optional) Name of the database engine to be used for the DocumentDB instance. Defaults to docdb. Valid Values: docdb"
  type        = string
  default     = null
}
variable "docdb_cluster_instance_identifier_prefix" {
  description = "(Optional, Forces new resource) Creates a unique identifier beginning with the specified prefix. Conflicts with identifier"
  type        = string
  default     = null
}
variable "docdb_cluster_instance_identifier" {
  description = "(Optional, Forces new resource) The identifier for the DocumentDB instance, if omitted, Terraform will assign a random, unique identifier"
  type        = string
  default     = null
}
variable "docdb_cluster_instance_instance_class" {
  description = "(Required) Instance class to use. For details on CPU and memory, see Scaling for DocumentDB Instances. See the aws_docdb_orderable_db_instance data source. See AWS Documentation for complete details"
  type        = string
}
variable "docdb_cluster_instance_performance_insights_kms_key_id" {
  description = "(Optional) KMS key identifier is the key ARN, key ID, alias ARN, or alias name for the KMS key. If you do not specify a value for PerformanceInsightsKMSKeyId, then Amazon DocumentDB uses your default KMS key"
  type        = string
  default     = null
}
variable "docdb_cluster_instance_preferred_maintenance_window" {
  description = "(Optional) Window to perform maintenance in. Syntax: \"ddd:hh24:mi-ddd:hh24:mi\". Eg: \"Mon:00:00-Mon:03:00\""
  type        = string
  default     = null
}
variable "docdb_cluster_instance_promotion_tier" {
  description = "(Optional) Failover Priority setting on instance level. Default 0. The reader who has lower tier has higher priority to get promoter to writer"
  type        = number
  default     = null
}
variable "docdb_cluster_instance_tags" {
  description = "(Optional) Map of tags to assign to the instance"
  type        = map(string)
  default     = {}
}
