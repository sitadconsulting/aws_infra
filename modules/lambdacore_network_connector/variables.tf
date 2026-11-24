variable "lambdacore_network_connector_name" {
  description = "(Required) Name of the network connector, unique within the account and Region. Changing this forces a new resource"
  type        = string
}
variable "lambdacore_network_connector_operator_role" {
  description = "(Required) ARN of the IAM role that the network connector service assumes to manage elastic network interfaces in your VPC"
  type        = string
}
variable "lambdacore_network_connector_configuration" {
  description = "(Required) Network configuration of the connector"
  type        = list(object({
    vpc_egress_configuration = list(object({
      associated_compute_resource_types = string
      network_protocol                  = optional(string)
      security_group_ids                = list(string)
      subnet_ids                        = list(string)
    }))
  }))
}
