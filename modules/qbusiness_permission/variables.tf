variable "qbusiness_permission_actions" {
  description = "The list of Amazon Q Business actions that the ISV is allowed to perform"
  type        = list(string)
}
variable "qbusiness_permission_application_id" {
  description = "The unique identifier of the Amazon Q Business application"
  type        = string
}
variable "qbusiness_permission_principal" {
  description = "Provides user and group information used for filtering documents to use for generating Amazon Q Business conversation responses"
  type        = string
}
variable "qbusiness_permission_statement_id" {
  description = "A unique identifier for the policy statement"
  type        = string
}
