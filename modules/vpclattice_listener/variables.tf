variable "vpclattice_listener_name" {
  description = "Name of the listener. A listener name must be unique within a service"
  type        = string
}
variable "vpcvpclattice_listener_port" {
  description = "Listener port. You can specify a value from 1 to 65535"
  type        = number
  default     = null
}
variable "vpcvpclattice_listener_protocol" {
  description = "Protocol for the listener. Supported values are HTTP or HTTPS"
  type        = string
}
variable "vpcvpclattice_listener_service_arn" {
  description = "Amazon Resource Name (ARN) of the VPC Lattice service. You must include either the service_arn or service_identifier arguments"
  type        = string
  default     = ""
}
variable "vpcvpclattice_listener_service_identifier" {
  description = "ID of the VPC Lattice service. You must include either the service_arn or service_identifier arguments"
  type        = string
  default     = ""
}
variable "vpcvpclattice_listener_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "vpcvpclattice_listener_default_action" {
  description = "Default action block for the default listener rule"
  type        = list(object({
    fixed_response = optional(list(object({
      status_code = number
    })))
    forward         = optional(list(object({
      target_groups = optional(list(object({
        target_group_identifier = optional(strinhg)
        weight                  = optional(number)
      })))
    })))
  }))
  default     = []
}
