variable "ec2_secondary_subnet_availability_zone" {
  description = "(Optional) Availability Zone for the secondary subnet. Cannot be specified with availability_zone_id"
  type        = string
  default     = null
}
variable "ec2_secondary_subnet_availability_zone_id" {
  description = "(Optional) ID of the Availability Zone for the secondary subnet. This option is preferred over availability_zone as it provides a consistent identifier across AWS accounts. Cannot be specified with availability_zone"
  type        = string
  default     = null
}
variable "ec2_secondary_subnet_ipv4_cidr_block" {
  description = "(Required) IPv4 CIDR block for the secondary subnet. The CIDR block size must be between /12 and /28"
  type        = string
  default     = null
}
variable "ec2_secondary_subnet_secondary_network_id" {
  description = "(Required) ID of the secondary network in which to create the secondary subnet"
  type        = string
}
variable "ec2_secondary_subnet_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
