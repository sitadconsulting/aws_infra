variable "ec2_availability_zone_group_group_name" {
  description = "(Required) Name of the Availability Zone Group"
  type        = string
}
variable "ec2_availability_zone_group_opt_in_status" {
  description = "(Required) Indicates whether to enable or disable Availability Zone Group. Valid values: opted-in or not-opted-in"
  type        = string
}
