variable "ssoadmin_account_assignment_instance_arn" {
  description = "ARN of of the SSO Instance"
  type        = string
}
variable "ssoadmin_account_assignment_permission_set_arn" {
  description = "ARN of the Permission Set that the admin wants to grant the principal access to"
  type        = string
}
variable "ssoadmin_account_assignment_principal_id" {
  description = "An identifier for an object in SSO, such as a user or group. PrincipalIds are GUIDs (For example, f81d4fae-7dec-11d0-a765-00a0c91e6bf6)."
  type        = string
}
variable "ssoadmin_account_assignment_principal_type" {
  description = "The entity type for which the assignment will be created. Valid values: USER, GROUP"
  type        = string
}
variable "ssoadmin_account_assignment_target_id" {
  description = "An AWS account identifier, typically a 10-12 digit string"
  type        = string
}
variable "ssoadmin_account_assignment_target_type" {
  description = "The entity type for which the assignment will be created. Valid values: AWS_ACCOUNT"
  type        = string
  default     = "AWS_ACCOUNT"
}
