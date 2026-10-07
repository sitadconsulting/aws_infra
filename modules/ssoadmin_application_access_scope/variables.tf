variable "ssoadmin_application_access_scope_application_arn" {
  description = "Specifies the ARN of the application with the access scope with the targets to add or update"
  type        = string
}
variable "ssoadmin_application_access_scope_authorized_targets" {
  description = "Specifies an array list of ARNs that represent the authorized targets for this access scope"
  type        = list(string)
  default     = []
}
variable "ssoadmin_application_access_scope_scope" {
  description = "Specifies the name of the access scope to be associated with the specified targets"
  type        = string
}
