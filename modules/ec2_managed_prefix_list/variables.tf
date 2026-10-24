variable "ec2_managed_prefix_list_address_family" {
  description = "(Required, Forces new resource) Address family (IPv4 or IPv6) of this prefix list"
  type        = string
}
variable "ec2_managed_prefix_list_max_entries" {
  description = "(Required) Maximum number of entries that this prefix list can contain"
  type        = number
}
variable "ec2_managed_prefix_list_name" {
  description = "(Required) Name of this resource. The name must not start with com.amazonaws"
  type        = string
}
variable "ec2_managed_prefix_list_tags" {
  description = "(Optional) Map of tags to assign to this resource"
  type        = map(string)
  default     = {}
}
variable "ec2_managed_prefix_list_entry" {
  description = "(Optional) Configuration block for prefix list entry. Detailed below. Different entries may have overlapping CIDR blocks, but a particular CIDR should not be duplicated"
  type        = list(object({
    cidr        = string
    description = optional(string)
  }))
  default     = []
}
