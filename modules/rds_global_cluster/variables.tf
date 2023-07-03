variable "rds_global_cluster_database_name" {
  description = "Name for an automatically created database on cluster creation"
  type        = string
  default     = ""
}
variable "rds_global_cluster_deletion_protection" {
  description = "Wether the Global Cluster should have deletion protection enabled. The database can't be deleted when this value is set to true. The default is false"
  type        = bool
  default     = false
}
variable "rds_global_cluster_engine" {
  description = "Name of the database engine to be used for this DB cluster. Terraform will only perform drift detection if a configuration value is provided. Valid values: aurora, aurora-mysql, aurora-postgresql. Defaults to aurora. Conflicts with source_db_cluster_identifier"
  type        = string
  default     = "aurora"
}
variable "rds_global_cluster_engine_version" {
  description = "Engine version of the Aurora global database. The engine, engine_version, and instance_class (on the aws_rds_cluster_instance) must together support global databases"
  type        = string
  default     = ""
}
variable "rds_global_cluster_force_destroy" {
  description = "Enable to remove DB Cluster members from Global Cluster on destroy. Required with source_db_cluster_identifier "
  type        = bool
  default     = true
}
variable "rds_global_cluster_global_cluster_identifier" {
  description = "Global cluster identifier"
  type        = string
}
variable "rds_global_cluster_source_db_cluster_identifier" {
  description = "ARN to use as the primary DB Cluster of the Global Cluster on creation. Terraform cannot perform drift detection of this value"
  type        = string
  default     = ""
}
variable "rds_global_cluster_storage_encrypted" {
  description = "Specifies whether the DB cluster is encrypted. The default is false unless source_db_cluster_identifier is specified and encrypted"
  type        = bool
  default     = false
}
