variable "fsx_file_cache_copy_tags_to_data_repository_associations" {
  description = "A boolean flag indicating whether tags for the cache should be copied to data repository associations. This value defaults to false"
  type        = bool
  default     = false
}
variable "fsx_file_cache_file_cache_type" {
  description = "The type of cache that you're creating. The only supported value is LUSTRE"
  type        = string
  default     = "LUSTRE"
}
variable "fsx_file_cache_file_cache_type_version" {
  description = "The version for the type of cache that you're creating. The only supported value is 2.12."
  type        = string
  default     = "2.12"
}
variable "fsx_file_cache_kms_key_id" {
  description = "Specifies the ID of the AWS Key Management Service (AWS KMS) key to use for encrypting data on an Amazon File Cache. If a KmsKeyId isn't specified, the Amazon FSx-managed AWS KMS key for your account is used"
  type        = string
  default     = null
}
variable "fsx_file_cache_security_group_ids" {
  description = " A list of IDs specifying the security groups to apply to all network interfaces created for Amazon File Cache access"
  type        = list(string)
  default     = null
}
variable "fsx_file_cache_storage_capacity" {
  description = "The storage capacity of the cache in gibibytes (GiB). Valid values are 1200 GiB, 2400 GiB, and increments of 2400 GiB"
  type        = number
}
variable "fsx_file_cache_subnet_ids" {
  description = "A list of subnet IDs that the cache will be accessible from. You can specify only one subnet ID"
  type        = list(string)
  default     = null
}
variable "fsx_file_cache_tags" {
  description = "(Optional) A map of tags to assign to the file cache"
  type        = map(string)
  default     = {}
}
variable "fsx_file_cache_data_repository_association" {
  description = "(optional) Max of 8. A list of up to 8 configurations for data repository associations (DRAs) to be created during the cache creation. The DRAs link the cache to either an Amazon S3 data repository or a Network File System (NFS) data repository that supports the NFSv3 protocol. The DRA configurations must meet the following requirements: 1) All configurations on the list must be of the same data repository type, either all S3 or all NFS. A cache can't link to different data repository types at the same time. 2) An NFS DRA must link to an NFS file system that supports the NFSv3 protocol. DRA automatic import and automatic export is not supported"
  type        = list(object({
    data_repository_path           = string
    data_repository_subdirectories = optional(list(string))
    file_cache_path                = string
    nfs                            = optional(list(object({
      dns_ips = optional(list(string))
      version = string
    })),[])
  }))
  default     = []
}
variable "fsx_file_cache_lustre_configuration" {
  description = "(optional) Lustre configuration"
  type        = list(object({
    deployment_type               = string
    per_unit_storage_throughput   = number
    weekly_maintenance_start_time = optional(string)
    metadata_configuration = list(object({
      storage_capacity = number
   }))
  }))
  default     = []
}
