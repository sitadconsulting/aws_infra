variable "vpc_endpoint_service_private_dns_verification_service_id" {
  description = "(Required) ID of the endpoint service"
  type        = string
}
variable "vpc_endpoint_service_private_dns_verification_wait_for_verification" {
  description = "(Optional) Whether to wait until the endpoint service returns a Verified status for the configured private DNS name"
  type        = bool
  default     = null
}
