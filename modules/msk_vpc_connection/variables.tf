variable "msk_vpc_connection_authentication" {
  description = "Required) The authentication type for the client VPC connection. Specify one of these auth type strings: SASL_IAM, SASL_SCRAM, or TLS"
  type        = string
}
variable "msk_vpc_connection_client_subnets" {
  description = "(Required) The list of subnets in the client VPC to connect to"
  type        = list(string)
}
variable "msk_vpc_connection_security_groups" {
  description = " (Required) The security groups to attach to the ENIs for the broker nodes"
  type        = list(string)
}
variable "msk_vpc_connection_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "msk_vpc_connection_target_cluster_arn" {
  description = "(Required) ARN of the cluster"
  type        = string
}
variable "msk_vpc_connection_vpc_id" {
  description = "(Required) The VPC ID of the remote client"
  type        = string
}
