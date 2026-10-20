variable "iam_service_specific_credential_credential_age_days" {
  description = "(Optional, Forces new resource) The number of days until the service specific credential expires. This field is only valid for Bedrock API keys and must be between 1 and 36600 (approximately 100 years). When not specified, the credential will not expire"
  type        = number
  default     = null
}
variable "iam_service_specific_credential_service_name" {
  description = "(Required) The name of the AWS service that is to be associated with the credentials. The service you specify here is the only service that can be accessed using these credentials. Supported services are codecommit.amazonaws.com, bedrock.amazonaws.com, and cassandra.amazonaws.com"
  type        = string
}
variable "iam_service_specific_credential_status" {
  description = "(Optional) The status to be assigned to the service-specific credential. Valid values are Active, Inactive, and Expired. Default value is Active. Note that Expired is only used for read operations and cannot be set manually"
  type        = string
  default     = null
}
variable "iam_service_specific_credential_user_name" {
  description = "(Required) The name of the IAM user that is to be associated with the credentials. The new service-specific credentials have the same permissions as the associated user except that they can be used only to access the specified service"
  type        = string
}
