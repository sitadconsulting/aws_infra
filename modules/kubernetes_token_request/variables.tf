variable "token_request_metadata_annotations" {
  description = "An unstructured key value map stored with the token that may be used to store arbitrary metadata"
  type        = map(any)
  default     = {}
}
variable "token_request_metadata_labels" {
  description = "Map of string keys and values that can be used to organize and categorize (scope and select) the token. Must match selectors"
  type        = map(string)
  default     = {}
}
variable "token_request_metadata_name" {
  description = "Name of the token, must be unique"
  type        = string
  default     = ""
}
variable "token_request_metadata_namespace" {
  description = "Namespace defines the space within which name of the tolen must be unique"
  type        = string
  default     = ""
}
variable "token_request_spec" {
  description = "Spec holds information about the request being evaluated"
  type        = list(object({
    audiences          = list(string)
    expiration_seconds = optional(number)
    bound_object_ref   = optional(list(object({
      api_version    = optional(string)
      kind           = optional(string)
      name           = optional(string)
      uid            = optional(string)
    })))
  }))
  default = []
}
