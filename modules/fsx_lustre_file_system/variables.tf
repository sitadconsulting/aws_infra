variable "fsx_lustre_file_system_auto_import_policy" {
  description = "(Optional) How Amazon FSx keeps your file and directory listings up to date as you add or modify objects in your linked S3 bucket. Only supported on PERSISTENT_1 deployment types"
  type        = string
  default     = null
}
variable "fsx_lustre_file_system_automatic_backup_retention_days" {
  description = "(Optional) The number of days to retain automatic backups. Setting this to 0 disables automatic backups. You can retain automatic backups for a maximum of 90 days. only valid for PERSISTENT_1 and PERSISTENT_2 deployment_type"
  type        = number
  default     = null
}
variable "fsx_lustre_file_system_backup_id" {
  description = "(Optional) The ID of the source backup to create the filesystem from"
  type        = string
  default     = null
}
variable "fsx_lustre_file_system_copy_tags_to_backups" {
  description = "(Optional) A boolean flag indicating whether tags for the file system should be copied to backups. Applicable for PERSISTENT_1 and PERSISTENT_2 deployment_type. The default value is false"
  type        = bool
  default     = false
}
variable "fsx_lustre_file_system_daily_automatic_backup_start_time" {
  description = "(Optional) A recurring daily time, in the format HH:MM. HH is the zero-padded hour of the day (0-23), and MM is the zero-padded minute of the hour. For example, 05:00 specifies 5 AM daily. only valid for PERSISTENT_1 and PERSISTENT_2 deployment_type. Requires automatic_backup_retention_days to be set"
  type        = string
  default     = null
}
variable "fsx_lustre_file_system_data_compression_type" {
  description = " (Optional) Sets the data compression configuration for the file system. Valid values are LZ4 and NONE. Default value is NONE. Unsetting this value reverts the compression type back to NONE"
  type        = string
  default     = "LZ4"
}
variable "fsx_lustre_file_system_deployment_type" {
  description = "(Optional) - The filesystem deployment type. One of: SCRATCH_1, SCRATCH_2, PERSISTENT_1, PERSISTENT_2"
  type        = string
  default     = null
}
variable "fsx_lustre_file_system_drive_cache_type" {
  description = "(Optional) - The type of drive cache used by PERSISTENT_1 filesystems that are provisioned with HDD storage_type. Required for HDD storage_type, set to either READ or NONE"
  type        = string
  default     = null
}
variable "fsx_lustre_file_system_efa_enabled" {
  description = "(Optional) Adds support for Elastic Fabric Adapter (EFA) and GPUDirect Storage (GDS) to Lustre. This must be set at creation. If set this cannot be changed and this prevents changes to per_unit_storage_throughput. This is only supported when deployment_type is set to PERSISTENT_2, metadata_configuration is used, and an EFA-enabled security group is attached"
  type        = bool
  default     = null
}
variable "fsx_lustre_file_system_export_path" {
  description = "(Optional) S3 URI (with optional prefix) where the root of your Amazon FSx file system is exported. Can only be specified with import_path argument and the path must use the same Amazon S3 bucket as specified in import_path. Set equal to import_path to overwrite files on export. Defaults to s3://{IMPORT BUCKET}/FSxLustre{CREATION TIMESTAMP}. Only supported on PERSISTENT_1 deployment types"
  type        = string
  default     = null
}
variable "fsx_lustre_file_system_file_system_type_version" {
  description = "(Optional) Sets the Lustre version for the file system. Valid values are 2.10, 2.12, and 2.15. When creating a file system, 2.10 is valid for SCRATCH_1, SCRATCH_2, and PERSISTENT_1 deployment types; 2.12 and 2.15 are valid for all deployment types. Changing this value to a higher version triggers an in-place upgrade. Changing to a lower version forces resource replacement (destroy and recreate)"
  type        = string
  default     = null
}
variable "fsx_lustre_file_system_final_backup_tags" {
  description = "(Optional) A map of tags to apply to the file system's final backup"
  type        = map(string)
  default     = {}
}
variable "fsx_lustre_file_system_import_path" {
  description = "(Optional) S3 URI (with optional prefix) that you're using as the data repository for your FSx for Lustre file system. For example, s3://example-bucket/optional-prefix/. Only supported on PERSISTENT_1 deployment types(Optional) S3 URI (with optional prefix) that you're using as the data repository for your FSx for Lustre file system. For example, s3://example-bucket/optional-prefix/. Only supported on PERSISTENT_1 deployment types"
  type        = string
  default     = null
}
variable "fsx_lustre_file_system_imported_file_chunk_size" {
  description = "(Optional) For files imported from a data repository, this value determines the stripe count and maximum amount of data per file (in MiB) stored on a single physical disk. Can only be specified with import_path argument. Defaults to 1024. Minimum of 1 and maximum of 512000. Only supported on PERSISTENT_1 deployment types"
  type        = number
  default     = null
}
variable "fsx_lustre_file_system_kms_key_id" {
  description = "(Optional) ARN for the KMS Key to encrypt the file system at rest, applicable for PERSISTENT_1 and PERSISTENT_2 deployment_type. Defaults to an AWS managed KMS Key"
  type        = string
  default     = null
}
variable "fsx_lustre_file_system_per_unit_storage_throughput" {
  description = "(Optional) - Describes the amount of read and write throughput for each 1 tebibyte of storage, in MB/s/TiB, required for the PERSISTENT_1 and PERSISTENT_2 deployment_type. Valid values for PERSISTENT_1 deployment_type and SSD storage_type are 50, 100, 200. Valid values for PERSISTENT_1 deployment_type and HDD storage_type are 12, 40. Valid values for PERSISTENT_2 deployment_type and SSD storage_type are 125, 250, 500, 1000 "
  type        = number
  default     = null
}
variable "fsx_lustre_file_system_security_group_ids" {
  description = " (Optional) A list of IDs for the security groups that apply to the specified network interfaces created for file system access. These security groups will apply to all network interfaces"
  type        = list(string)
  default     = null
}
variable "fsx_lustre_file_system_skip_final_backup" {
  description = "(Optional) When enabled, will skip the default final backup taken when the file system is deleted. This configuration must be applied separately before attempting to delete the resource to have the desired behavior. Defaults to true"
  type        = bool
  default     = false
}
variable "fsx_lustre_file_system_storage_capacity" {
  description = "(Optional) The storage capacity (GiB) of the file system. Minimum of 1200. See more details at Allowed values for Fsx storage capacity. Update is allowed only for SCRATCH_2, PERSISTENT_1 and PERSISTENT_2 deployment types, required when not creating filesystem for a backup"
  type        = number
  default     = null
}
variable "fsx_lustre_file_system_storage_type" {
  description = "(Optional) - The filesystem storage type. One of SSD, HDD or INTELLIGENT_TIERING, defaults to SSD. HDD is only supported on PERSISTENT_1 deployment types. INTELLIGENT_TIERING requires data_read_cache_configuration and metadata_configuration to be set and is only supported for PERSISTENT_2 deployment types"
  type        = string
  default     = null
}
variable "fsx_lustre_file_system_subnet_ids" {
  description = "(Required) A list of IDs for the subnets that the file system will be accessible from. File systems currently support only one subnet. The file server is also launched in that subnet's Availability Zone"
  type        = list(string)
}
variable "fsx_lustre_file_system_tags" {
  description = "(Optional) A map of tags to assign to the file system"
  type        = map(string)
  default     = {}
}
variable "fsx_lustre_file_system_throughput_capacity" {
  description = " (Optional) Throughput in MBps required for the INTELLIGENT_TIERING storage type. Must be 4000 or multiples of 4000"
  type        = number
  default     = null
}
variable "fsx_lustre_file_system_weekly_maintenance_start_time" {
  description = "(Optional) The preferred start time (in d:HH:MM format) to perform weekly maintenance, in the UTC time zone."
  type        = string
  default     = null
}
variable "fsx_lustre_file_system_data_read_cache_configuration" {
  description = "Specifies the optional provisioned SSD read cache on FSx for Lustre file systems that use the Intelligent-Tiering storage class. Required when StorageType is set to INTELLIGENT_TIERING"
  type        = list(object({
    size        = optional(number)
    sizing_mode = string
  }))
  default     = []
}
variable "fsx_lustre_file_system_log_configuration" {
  description = "(Optional) The Lustre logging configuration used when creating an Amazon FSx for Lustre file system. When logging is enabled, Lustre logs error and warning events for data repositories associated with your file system to Amazon CloudWatch Logs"
  type        = list(object({
    destination = optional(string)
    level       = optional(string)
  }))
  default     = []
}
variable "fsx_lustre_file_system_metadata_configuration" {
  description = "(Optional) The Lustre metadata configuration used when creating an Amazon FSx for Lustre file system. This can be used to specify a user provisioned metadata scale. This is only supported when deployment_type is set to PERSISTENT_2"
  type        = list(object({
    mode = optional(string)
    iops = optional(number)
  }))
  default     = []
}
variable "fsx_lustre_file_system_root_squash_configuration" {
  description = "(Optional) The Lustre root squash configuration used when creating an Amazon FSx for Lustre file system. When enabled, root squash restricts root-level access from clients that try to access your file system as a root user"
  type        = list(object({
    no_squash_nids = optional(list(string))
    root_squash    = optional(string)
  }))
  default     = []
}
