variable "fsx_data_repository_association_batch_import_meta_data_on_create" {
  description = "(Optional) Set to true to run an import data repository task to import metadata from the data repository to the file system after the data repository association is created. Defaults to false"
  type        = bool
  default     = true
}
variable "fsx_data_repository_association_data_repository_path" {
  description = "(Required) The path to the Amazon S3 data repository that will be linked to the file system. The path must be an S3 bucket s3://myBucket/myPrefix/. This path specifies where in the S3 data repository files will be imported from or exported to. The same S3 bucket cannot be linked more than once to the same file system"
  type        = string
}
variable "fsx_data_repository_association_delete_data_in_filesystem" {
  description = "(Optional) Set to true to delete files from the file system upon deleting this data repository association. Defaults to false"
  type        = bool
  default     = false
}
variable "fsx_data_repository_association_file_system_id" {
  description = "(Required) The ID of the Amazon FSx file system to on which to create a data repository association"
  type        = string
}
variable "fsx_data_repository_association_file_system_path" {
  description = "(Required) A path on the file system that points to a high-level directory (such as /ns1/) or subdirectory (such as /ns1/subdir/) that will be mapped 1-1 with data_repository_path. The leading forward slash in the name is required. Two data repository associations cannot have overlapping file system paths. For example, if a data repository is associated with file system path /ns1/, then you cannot link another data repository with file system path /ns1/ns2. This path specifies where in your file system files will be exported from or imported to. This file system directory can be linked to only one Amazon S3 bucket, and no other S3 bucket can be linked to the directory"
  type        = string
}
variable "fsx_data_repository_association_imported_file_chunk_size" {
  description = " (Optional) For files imported from a data repository, this value determines the stripe count and maximum amount of data per file (in MiB) stored on a single physical disk. The maximum number of disks that a single file can be striped across is limited by the total number of disks that make up the file system"
  type        = number
  default     = null
}
variable "fsx_data_repository_association_tags" {
  description = "(Optional) A map of tags to assign to the data repository association"
  type        = map(string)
  default     = {}
}
variable "fsx_data_repository_association_s3" {
  description = "(Optional) The configuration for an Amazon S3 data repository linked to an Amazon FSx Lustre file system with a data repository association. The configuration defines which file events (new, changed, or deleted files or directories) are automatically imported from the linked data repository to the file system or automatically exported from the file system to the data repository"
  type        = list(object({
    auto_export_policy = optional(list(object({
      events = list(string)
    })))
    auto_import_policy = optional(list(object({
      events = list(string)
    })))
  }))
  default     = []
}
