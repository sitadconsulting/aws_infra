variable "appsync_domain_name_certificate_arn" {
  description = "(Required) ARN of the certificate. This can be an Certificate Manager (ACM) certificate or an Identity and Access Management (IAM) server certificate. The certifiacte must reside in us-east-1"
  type        = string
}
variable "appsync_domain_name_description" {
  description = "(Optional) Description of the Domain Name"
  type        = string
  default     = null
}
variable "appsync_domain_name_domain_name" {
  description = "(Required) Domain name"
  type        = string
}
