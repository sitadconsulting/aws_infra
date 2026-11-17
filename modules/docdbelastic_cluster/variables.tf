variable "docdbelastic_cluster_admin_user_name" {
  description = "(Required) Name of the Elastic DocumentDB cluster administrator"
  type        = string
}
variable "docdbelastic_cluster_admin_user_password" {
  description = "(Required) Password for the Elastic DocumentDB cluster administrator. Can contain any printable ASCII characters. Must be at least 8 characters"
  type        = string
}
variable "docdbelastic_cluster_auth_type" {
  description = "(Required) Authentication type for the Elastic DocumentDB cluster. Valid values are PLAIN_TEXT and SECRET_ARN"
  type        = string
}
variable "docdbelastic_cluster_backup_retention_period" {
  description = "(Optional) The number of days for which automatic snapshots are retained. It should be in between 1 and 35. If not specified, the default value of 1 is set "
  type        = number
  default     = null
}
variable "docdbelastic_cluster_kms_key_id" {
  description = "(Optional) ARN of a KMS key that is used to encrypt the Elastic DocumentDB cluster. If not specified, the default encryption key that KMS creates for your account is used"
  type        = string
  default     = null
}
variable "docdbelastic_cluster_name" {
  description = "(Required) Name of the Elastic DocumentDB cluster"
  type        = string
}
variable "docdbelastic_cluster_preferred_backup_window" {
  description = "(Optional) The daily time range during which automated backups are created if automated backups are enabled, as determined by the backup_retention_period "
  type        = string
  default     = null
}
variable "docdbelastic_cluster_preferred_maintenance_window" {
  description = "(Optional) Weekly time range during which system maintenance can occur in UTC. Format: ddd:hh24:mi-ddd:hh24:mi. If not specified, AWS will choose a random 30-minute window on a random day of the week"
  type        = string
  default     = null
}
variable "docdbelastic_cluster_shard_capacity" {
  description = "(Required) Number of vCPUs assigned to each elastic cluster shard. Maximum is 64. Allowed values are 2, 4, 8, 16, 32, 64"
  type        = number
}
variable "docdbelastic_cluster_shard_count" {
  description = "(Required) Number of shards assigned to the elastic cluster. Maximum is 32"
  type        = number
}
variable "docdbelastic_cluster_shard_instance_count" {
  description = "(Optional) Number of replica instances applying to all shards in the elastic cluster. If not specified, the default value of 2 is set"
  type        = number
  default     = null
}
variable "docdbelastic_cluster_subnet_ids" {
  description = "(Optional) IDs of subnets in which the Elastic DocumentDB Cluster operates"
  type        = list(string)
  default     = null
}
variable "docdbelastic_cluster_tags" {
  description = "(Optional) A map of tags to assign to the collection"
  type        = map(string)
  default     = {}
}
variable "docdbelastic_cluster_vpc_security_group_ids" {
  description = "(Optional) List of VPC security groups to associate with the Elastic DocumentDB Cluster"
  type        = list(string)
  default     = null
}
