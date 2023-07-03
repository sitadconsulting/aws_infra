variable "vpclattice_service_network_name" {
  description = "Name of the service network"
  type        = string
}
variable "vpclattice_service_network_auth_type" {
  description = "Type of IAM policy. Either NONE or AWS_IAM"
  type        = string
  default     = ""
}
variable "vpclattice_service_network_tags" {
  description = "Key-value mapping of resource tags"
  type        = map(string)
  default     = {}
}
