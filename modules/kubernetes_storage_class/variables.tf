variable "storage_class_metadata_annotations" {
  description = "An unstructured key value map stored with the Storage Class that may be used to store arbitrary metadata "
  type        = map(any)
  default     = {}
}
variable "storage_class_metadata_labels" {
  description = "Map of string keys and values that can be used to organize and categorize (scope and select) the StorageClass. May match selectors of replication controllers and services"
  type        = map(string)
  default     = {}
}
variable "storage_class_metadata_name" {
  description = "Name of the Storage Class, must be unique"
  type        = string
  default     = ""
}
variable "storage_class_parameters" {
  description = "The parameters for the provisioner that should create volumes of this storage class"
  type        = map(string)
  default     = {}
}
variable "storage_class_storage_provisioner" {
  description = "Indicates the type of the provisioner"
  type        = string
  default     = ""
}
variable "storage_class_reclaim_policy" {
  description = "Indicates the reclaim policy to use. If no reclaimPolicy is specified when a StorageClass object is created, it will default to Delete"
  type        = string
  default     = null
}
variable "storage_class_volume_binding_mode" {
  description = "Indicates when volume binding and dynamic provisioning should occur"
  type        = string
  default     = ""
}
variable "storage_class_allow_volume_expansion" {
  description = "Indicates whether the storage class allow volume expand, default true."
  type        = bool 
  default     = true
}
variable "storage_class_mount_options" {
  description = "Persistent Volumes that are dynamically created by a storage class will have the mount options specified"
  type        = list(string)
  default     = []
}
variable "storage_class_allowed_topologies" {
  description = "Restrict the node topologies where volumes can be dynamically provisioned"
  type        = map(object({
    match_label_expressions = optional(list(object({
      key    = optional(string)
      values = optional(list(string))
    })))
  }))
  default  = {}
}
