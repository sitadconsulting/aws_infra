variable "service_account_automount_service_account_token" {
  description = "Whether to enable automatic mounting of the Service Account token"
  type        = bool
  default     = true
}
variable "service_account_metadata_annotations" {
  description = "An unstructured key value map stored with the Service Account that may be used to store arbitrary metadata"
  type        = map(string)
  default     = {}
}
variable "service_account_metadata_labels" {
  description = "Map of string keys and values that can be used to organize and categorize (scope and select) the Service Account"
  type        = map(string)
  default     = {}
}
variable "service_account_metadata_name" {
  description = "Name of the Service Account, must be unique. Cannot be updated"
  type        = string
  default     = ""
}
variable "service_account_metadata_namespace" {
  description = "Namespace defines the space within which name of the Service Account must be unique"
  type        = string
  default     = ""
}
variable "service_account_image_pull_secret" {
  description = "A list of references to secrets in the same namespace to use for pulling any images in pods that reference this Service Account"
  type        = list(object({
    name      = string
  }))
  default      = []
}
variable "service_account_secret" {
  description = "A list of secrets allowed to be used by pods running using this Service Account"
  type        = list(object({
    name      = string
  }))
  default      = []
}
