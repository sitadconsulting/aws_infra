variable "ec2_capacity_reservation_availability_zone" {
  description = "(Required) The Availability Zone in which to create the Capacity Reservation"
  type        = string
}
variable "ec2_capacity_reservation_ebs_optimized" {
  description = "(Optional) Indicates whether the Capacity Reservation supports EBS-optimized instances"
  type        = bool
  default     = null
}
variable "ec2_capacity_reservation_end_date" {
  description = "(Optional) The date and time at which the Capacity Reservation expires. When a Capacity Reservation expires, the reserved capacity is released and you can no longer launch instances into it. Valid values: RFC3339 time string (YYYY-MM-DDTHH:MM:SSZ)"
  type        = string
  default     = null
}
variable "ec2_capacity_reservation_end_date_type" {
  description = "(Optional) Indicates the way in which the Capacity Reservation ends. Specify either unlimited or limited"
  type        = string
  default     = null
}
variable "ec2_capacity_reservation_ephemeral_storage" {
  description = "(Optional) Indicates whether the Capacity Reservation supports instances with temporary, block-level storage"
  type        = bool
  default     = null
}
variable "ec2_capacity_reservation_instance_count" {
  description = "(Required) The number of instances for which to reserve capacity"
  type        = number
}
variable "ec2_capacity_reservation_instance_match_criteria" {
  description = "(Optional) Indicates the type of instance launches that the Capacity Reservation accepts. Specify either open or targeted"
  type        = string
  default     = null
}
variable "ec2_capacity_reservation_instance_platform" {
  description = "(Required) The type of operating system for which to reserve capacity. Valid options are Linux/UNIX, Red Hat Enterprise Linux, SUSE Linux, Windows, Windows with SQL Server, Windows with SQL Server Enterprise, Windows with SQL Server Standard or Windows with SQL Server Web"
  type        = string
}
variable "ec2_capacity_reservation_instance_type" {
  description = "(Required) The instance type for which to reserve capacity"
  type        = string
}
variable "ec2_capacity_reservation_outpost_arn" {
  description = "(Optional) ARN of the Outpost on which to create the Capacity Reservation"
  type        = string
  default     = null
}
variable "ec2_capacity_reservation_placement_group_arn" {
  description = "(Optional) ARN of the cluster placement group in which to create the Capacity Reservation"
  type        = string
  default     = null
}
variable "ec2_capacity_reservation_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "ec2_capacity_reservation_tenancy" {
  description = "(Optional) Indicates the tenancy of the Capacity Reservation. Specify either default or dedicated"
  type        = string
  default     = null
}
