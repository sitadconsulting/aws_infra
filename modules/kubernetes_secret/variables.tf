
variable "secret_metadata_annotations" {
  description = "An unstructured key value map stored with the secret that may be used to store arbitrary metadata"
  type        = map(any)
  default     = {}
}
variable "secret_metadata_labels" {
  description = "Map of string keys and values that can be used to organize and categorize (scope and select) the secret. May match selectors of replication controllers and services"
  type        = map(string)
  default     = {}
}
variable "secret_metadata_name" {
  description = "Name of the secret, must be unique"
  type        = string
  default     = ""
}
variable "secret_metadata_namespace" {
  description = "Namespace defines the space within which name of the secret must be unique"
  type        = string
  default     = ""
}
variable "secret_data" {
  description = "A map of the secret data"
  type        = map(string)
  default     = {}
}
variable "secret_binary_data" {
  description = "A map of the secret data in base64 encoding. Use this for binary data"
  type        = map(string)
  default     = {}
}
variable "secret_type" {
  description = "The secret type. Defaults to Opaque"
  type        = string
  default     = ""
}
variable "secret_immutable" {
  description = "Ensures that data stored in the Secret cannot be updated (only object metadata can be modified)"
  type        = bool
  default     = true
}
variable "secret_wait_for_service_account_token" {
  description = "Terraform will wait for the service account token to be created. Defaults to true"
  type        = bool
  default     = false
}
