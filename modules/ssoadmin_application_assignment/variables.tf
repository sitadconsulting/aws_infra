variable "ssoadmin_application_assignment_application_arn" {
  description = "Application ARN"
  type        = string
}
variable "ssoadmin_application_assignment_principal_id" {
  description = "An identifier for an object in IAM Identity Center, such as a user or group"
  type        = string
}
variable "ssoadmin_application_assignment_principal_type" {
  description = "Entity type for which the assignment will be created. Valid values are USER or GROUP"
  type        = string
}
