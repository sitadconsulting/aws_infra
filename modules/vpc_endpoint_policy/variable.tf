variable "vpc_endpoint_policy_policy" {
  description = "The VPC Endpoint ID"
  type        = string
}
variable "vpc_endpoint_policy_vpc_endpoint_id" {
  description = "A policy to attach to the endpoint that controls access to the service. Defaults to full access"
  type        = string
  default     = null
}
