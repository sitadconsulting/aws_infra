variable "vpc_endpoint_service_allowed_principal_principal_arn" {
  description = "The ARN of the principal to allow permissions"
  type        = string
}
variable "vpc_endpoint_service_allowed_principal_vpc_endpoint_service_id" {
  description = "The ID of the VPC endpoint service to allow permission "
  type        = string
}
