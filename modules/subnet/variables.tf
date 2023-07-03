variable "subnet_assign_ipv6_address_on_creation" {
  description = "Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. Default is false"
  type        = bool
  default     = false
}
variable "subnet_availability_zone" {
  description = "AZ for the subnet"
  type        = string
  default     = ""
}
variable "subnet_availability_zone_id" {
  description = "AZ ID of the subnet. This argument is not supported in all regions or partitions. If necessary, use availability_zone instead"
  type        = string
  default     = null
}
variable "subnet_cidr_block" {
  description = "The IPv4 CIDR block for the subnet"
  type        = string
  default     = ""
}
variable "subnet_customer_owned_ipv4_pool" {
  description = "The customer owned IPv4 address pool. Typically used with the map_customer_owned_ip_on_launch argument. The outpost_arn argument must be specified when configured"
  type        = string
  default     = ""
}
variable "subnet_enable_dns64" {
  description = "Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: false"
  type        = bool
  default     = false
}
variable "subnet_enable_lni_at_device_index" {
  description = "Indicates the device position for local network interfaces in this subnet. For example, 1 indicates local network interfaces in this subnet are the secondary network interface (eth1). A local network interface cannot be the primary network interface (eth0)"
  type        = number
  default     = null
}
variable "subnet_enable_resource_name_dns_aaaa_record_on_launch" {
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: false"
  type        = bool
  default     = false
}
variable "subnet_enable_resource_name_dns_a_record_on_launch" {
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: false"
  type        = bool
  default     = false
}
variable "subnet_ipv6_cidr_block" {
  description = "The IPv6 network range for the subnet, in CIDR notation. The subnet size must use a /64 prefix length"
  type        = string
  default     = null
}
variable "subnet_ipv6_native" {
  description = "Indicates whether to create an IPv6-only subnet. Default: false"
  type        = bool
  default     = false
}
variable "subnet_map_customer_owned_ip_on_launch" {
  description = "Specify true to indicate that network interfaces created in the subnet should be assigned a customer owned IP address. The customer_owned_ipv4_pool and outpost_arn arguments must be specified when set to true. Default is false"
  type        = bool
  default     = false
}
variable "subnet_map_public_ip_on_launch" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is false"
  type        = bool
  default     = false
}
variable "subnet_outpost_arn" {
  description = "The Amazon Resource Name (ARN) of the Outpost"
  type        = string
  default     = ""
}
variable "subnet_private_dns_hostname_type_on_launch" {
  description = " The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: ip-name, resource-name"
  type        = string
  default     = null
}
variable "subnet_vpc_id" {
  description = "The VPC ID"
  type        = string
}
variable "subnet_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
