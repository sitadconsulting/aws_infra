#variable "config_map_metadata_annotations" {
#  description = "Annotations to set for this metadata config map object"
#  type        = map(string)
#  default     = {}
#}
#variable "config_map_metadata_labels" {
#  description = "Labels to set for this metadata config map object"
#  type        = map(string)
#  default     = {}
#}
#variable "config_map_metadata_name" {
#  description = "Name to set for this metadata config map object"
#  type        = string
#  default     = null
#}
#variable "config_map_metadata_namespace" {
#  description = "Namespace to set for this metadata config map object"
#  type        = string
#  default     = null
#}
variable "config_map_binary_data" {
  description = "BinaryData contains the binary data. Each key must consist of alphanumeric characters, '-', '_' or '.'. BinaryData can contain byte sequences that are not in the UTF-8 range. The keys stored in BinaryData must not overlap with the ones in the Data field, this is enforced during validation process. Using this field will require 1.10+ apiserver and kubelet. This field only accepts base64-encoded payloads that will be decoded/encoded before being sent/received to/from the apiserver"
  type        = map(string)
  default     = {}
}
variable "config_map_data" {
  description = "Data contains the configuration data. Each key must consist of alphanumeric characters, '-', '_' or '.'. Values with non-UTF-8 byte sequences must use the BinaryData field. The keys stored in Data must not overlap with the keys in the BinaryData field, this is enforced during validation process"
  type        = map(string)
  default     = {}
}
variable "config_map_immutable" {
  description = "Immutable, if set to true, ensures that data stored in the ConfigMap cannot be updated (only object metadata can be modified). If not set to true, the field can be modified at any time. Defaulted to nil"
  type        = bool
  default     = true
}
variable "config_map_metadata" {
  description = "Standard config map's metadata"
  type        = list(object({
    name      = string
    namespace = optional(string)
  }))
}

