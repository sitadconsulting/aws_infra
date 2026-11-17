variable "docdb_global_cluster_database_name" {
  description = "(Optional, Forces new resources) Name for an automatically created database on cluster creation" 
  type        = string
  default     = null
}
variable "docdb_global_cluster_deletion_protection" {
  description = "(Optional) If the Global Cluster should have deletion protection enabled. The database can't be deleted when this value is set to true. The default is false" 
  type        = bool
  default     = false
}
variable "docdb_global_cluster_engine" {
  description = "(Optional, Forces new resources) Name of the database engine to be used for this DB cluster. Terraform will only perform drift detection if a configuration value is provided. Current Valid values: docdb. Defaults to docdb. Conflicts with source_db_cluster_identifier" 
  type        = string
  default     = null
}
variable "docdb_global_cluster_engine_version" {
  description = "(Optional) Engine version of the global database. Upgrading the engine version will result in all cluster members being immediately updated and will.  NOTE: Upgrading major versions is not supported" 
  type        = string
  default     = null
}
variable "docdb_global_cluster_global_cluster_identifier" {
  description = "(Required, Forces new resources) The global cluster identifier"
  type        = string
}
variable "docdb_global_cluster_source_db_cluster_identifier" {
  description = "(Optional) ARN to use as the primary DB Cluster of the Global Cluster on creation. Terraform cannot perform drift detection of this value" 
  type        = string
  default     = null
}
variable "docdb_global_cluster_storage_encrypted" {
  description = "(Optional, Forces new resources) Specifies whether the DB cluster is encrypted. The default is false unless source_db_cluster_identifier is specified and encrypted. Terraform will only perform drift detection if a configuration value is provided" 
  type        = bool
  default     = false
}
