variable "vpclattice_service_name" {
  description = "Name of the service. The name must be unique within the account"
  type        = string
}
variable "vpclattice_service_auth_type" {
  description = "Type of IAM policy. Either NONE or AWS_IAM"
  type        = string
  default     = ""
}
variable "vpclattice_service_certificate_arn" {
  description = "Amazon Resource Name (ARN) of the certificate"
  type        = string
  default     = ""
}
variable "vpclattice_service_custom_domain_name" {
  description = "Custom domain name of the service"
  type        = string
  default     = ""
}
variable "vpclattice_service_tags" {
  description = "Key-value mapping of resource tags"
  type        = map(string)
  default     = {}
}
