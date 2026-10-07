variable "ssoadmin_application_application_provider_arn" {
  description = "ARN of the application provider "
  type        = string
}
variable "ssoadmin_application_client_token" {
  description = "A unique, case-sensitive ID that you provide to ensure the idempotency of the request. AWS generates a random value when not provided"
  type        = string
  default     = null
}
variable "ssoadmin_application_description" {
  description = "Description of the application"
  type        = string
  default     = null
}
variable "ssoadmin_application_name" {
  description = "Name of the application"
  type        = string
}
variable "ssoadmin_application_instance_arn" {
  description = "ARN of the instance of IAM Identity Center"
  type        = string
}
variable "ssoadmin_application_status" {
  description = "Status of the application. Valid values are ENABLED and DISABLED"
  type        = string
  default     = null
}
variable "ssoadmin_application_tags" {
  description = "Key-value mapping of resource tags"
  type        = map(string)
  default     = {}
}
variable "ssoadmin_application_portal_options" {
  description = "Options for the portal associated with an application"
  type        = list(object({
    visibility      = optional(string)
    sign_in_options = optional(list(object({
      application_url = optional(string)
      origin          = string
    })))
  }))
  default = []
}
