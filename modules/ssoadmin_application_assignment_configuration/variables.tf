variable "ssoadmin_application_assignment_configuration_application_arn" {
  description = "Application ARN"
  type        = string
}
variable "ssoadmin_application_assignment_configuration_assignment_required" {
  description = "Indicates whether users must have an explicit assignment to access the application. If false, all users have access to the application"
  type        = bool
}
