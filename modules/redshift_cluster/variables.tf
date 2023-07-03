variable "redshift_cluster_allow_version_upgrade" {
  description = "Wether major version upgrades can be applied during the maintenance window to the Amazon Redshift engine that is running on the cluster. Default is true"
  type        = bool
  default     = true
}
variable "redshift_cluster_apply_immediately" {
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. Default is false."
  type        = bool 
  default     = false
}
variable "redshift_cluster_aqua_configuration_status" {
  description = " The value represents how the cluster is configured to use AQUA (Advanced Query Accelerator) after the cluster is restored. Possible values are enabled, disabled, and auto. Requires Cluster reboot"
  type        = string
  default     = ""
}
variable "redshift_cluster_automated_snapshot_retention_period" {
  description = "The number of days that automated snapshots are retained. If the value is 0, automated snapshots are disabled. Even if automated snapshots are disabled, you can still create manual snapshots when you want with create-cluster-snapshot. Default is 1"
  type        = number
  default     = 1
}
variable "redshift_cluster_availability_zone" {
  description = "The EC2 Availability Zone (AZ) in which you want Amazon Redshift to provision the cluster"
  type        = string
  default     = ""
}
variable "redshift_cluster_availability_zone_relocation_enabled" {
  description = "Whether he cluster can be relocated to another availabity zone, either automatically by AWS or when requested. Default is false. Available for use on clusters from the RA3 instance family"
  type        = bool
  default     = false
}
variable "redshift_cluster_cluster_identifier" {
  description = "The Cluster Identifier"
  type        = string
}
variable "redshift_cluster_cluster_parameter_group_name" {
  description = "The name of the parameter group to be associated with this cluster"
  type        = string
  default     = ""
}
variable "redshift_cluster_cluster_security_groups" {
  description = "A list of security groups to be associated with this cluster"
  type        = lsit(string)
  default     = []
}
variable "redshift_cluster_cluster_subnet_group_name" {
  description = "The name of a cluster subnet group to be associated with this cluster. If this parameter is not provided the resulting cluster will be deployed outside virtual private cloud (VPC)"
  type        = string
  default     = ""
}
variable "redshift_cluster_cluster_type" {
  description = "The cluster type to use. Either single-node or multi-node"
  type        = string
  default     = ""
}
variable "redshift_cluster_cluster_version" {
  description = "The version of the Amazon Redshift engine software that you want to deploy on the cluster. The version selected runs on all the nodes in the cluster"
  type        = string
  default     = ""
}
variable "redshift_cluster_database_name" {
  description = "The name of the first database to be created when the cluster is created. If you do not provide a name, Amazon Redshift will create a default database called dev"
  type        = string
  default     = ""
}
variable "redshift_cluster_default_iam_role_arn" {
  description = "ARN for the IAM role that was set as default for the cluster when the cluster was created"
  type        = string
  default     = ""
}
variable "redshift_cluster_elastic_ip" {
  description = "The Elastic IP (EIP) address for the cluster"
  type        = string
  default     = ""
}
variable "redshift_cluster_encrypted" {
  description = "Whether the data in the cluster is encrypted at rest"
  type        = bool
  default     = false
}
variable "redshift_cluster_enhanced_vpc_routing" {
  description = "whether enhanced VPC routing is enabled"
  type        = bool
  default     = true
}
variable "redshift_cluster_final_snapshot_identifier" {
  description = "The identifier of the final snapshot that is to be created immediately before deleting the cluster. If this parameter is provided, skip_final_snapshot must be false"
  type        = string
  default     = ""
}
variable "redshift_cluster_iam_roles" {
  description = "A list of IAM Role ARNs to associate with the cluster. A Maximum of 10 can be associated to the cluster at any time"
  type        = list(string)
  default     = []
}
variable "redshift_cluster_kms_key_id" {
  description = "ARN for the KMS encryption key. When specifying kms_key_id, encrypted needs to be set to true"
  type        = string
  default     = ""
}
variable "redshift_cluster_maintenance_track_name" {
  description = " The name of the maintenance track for the restored cluster. Default: current"
  type        = string
  default     = "current"
}
variable "redshift_cluster_manual_snapshot_retention_period" {
  description = "The default number of days to retain a manual snapshot. If the value is -1, the snapshot is retained indefinitely. Valid values are between -1 and 3653. Default value is -1 "
  type        = number
  default     = null
}
variable "redshift_cluster_master_password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file"
  type        = string
}
variable "redshift_cluster_master_username" {
  description = "Username for the master DB user"
  type        = string
}
variable "redshift_cluster_node_type" {
  description = "The node type to be provisioned for the cluster"
  type        = string
}
variable "redshift_cluster_number_of_nodes" {
  description = "The number of compute nodes in the cluster. This parameter is required when the ClusterType parameter is specified as multi-node. Default is 1"
  type        = number
  default     = 1
}
variable "redshift_cluster_owner_account" {
  description = "The AWS customer account used to create or copy the snapshot. Required if you are restoring a snapshot you do not own, optional if you own the snapshot"
  type        = string
  default     = ""
}
variable "redshift_cluster_port" {
  description = "The port number on which the cluster accepts incoming connections. Valid values are between 1115 and 65535. The cluster is accessible only via the JDBC and ODBC connection strings. Part of the connection string requires the port on which the cluster will listen for incoming connections. Default port is 5439. "
  type        = number
  default     = 5439
}
variable "redshift_cluster_preferred_maintenance_window" {
  description = "The weekly time range (in UTC) during which automated cluster maintenance can occur. Format: ddd:hh24:mi-ddd:hh24:mi"
  type        = string
  default     = ""
}
variable "redshift_cluster_publicly_accessible" {
  description = "Whether the cluster can be accessed from a public network. Default is true"
  type        = bool
  default     = false
}
variable "redshift_cluster_skip_final_snapshot" {
  description = "Determines whether a final snapshot of the cluster is created before Amazon Redshift deletes the cluster. If true , a final cluster snapshot is not created. If false , a final cluster snapshot is created before the cluster is deleted. Default is false"
  type        = bool
  default     = true
}
variable "redshift_cluster_snapshot_cluster_identifier" {
  description = "The name of the cluster the source snapshot was created from"
  type        = string
  default     = ""
}
variable "redshift_cluster_snapshot_identifier" {
  description = "The name of the snapshot from which to create the new cluster"
  type        = string
  default     = ""
}
variable "redshift_cluster_vpc_security_group_ids" {
  description = "A list of Virtual Private Cloud (VPC) security groups to be associated with the cluster"
  type        = list(string)
  default     = []
}
variable "redshift_cluster_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "redshift_cluster_logging" {
  description = "Configuration for enabling logging information such as queries and connection attempts, for the specified Amazon Redshift cluster "
  type        = list(object({
    bucket_name          = optional(string)
    enable               = bool
    log_destination_type = optional(string)
    log_exports          = optional(list(string)) 
    s3_key_prefix        = optional(string)
  }))
  default     = []
}
variable "redshift_cluster_snapshot_copy" {
  description = "Configuration for handling snapshot copy"
  type        = list(object({
    destionation_region = string
    grant_name          = optional(string)
    retention_period    = optional(number)
  }))
  default     = []
}
