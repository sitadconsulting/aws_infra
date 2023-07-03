variable "persistent_volume_claim_metadata_name" {
  description = "Name of the Persistent Volume Claim, must be unique "
  type        = string
  default     = ""
}
variable "persistent_volume_claim_metadata_namespace" {
  description = "Namespace defines the space within which name of the Persistent Volume Claim must be unique "
  type        = string
  default     = ""
}
variable "persistent_volume_claim_spec_access_modes" {
  description = "A set of the desired access modes the volume should have"
  type        = set(any) 
  default     = []
}
variable "persistent_volume_claim_spec_volume_name" {
  description = "The binding reference to the PersistentVolume backing this claim"
  type        = string
  default     = ""
}
variable "persistent_volume_claim_spec_storage_class_name" {
  description = "Name of the storage class requested by the claim"
  type        = string
  default     = ""
}
variable "persistent_volume_claim_spec_resources" {
  description = "A list of the minimum resources the volume should have"
  type        = list(object({
    limits    = optional(map(string))
    requests  = optional(map(string))
  }))
  default = []
}
variable "persistent_volume_claim_spec_selector" {
  description = "A label query over volumes to consider for binding"
  type        = map(object({
    match_expressions = optional(list(object({
      key      = optional(string)
      operator = optional(string)
      values   = optional(list(string))
    })))
  }))
  default = {}
}
