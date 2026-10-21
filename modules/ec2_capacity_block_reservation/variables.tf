variable "ec2_capacity_block_reservation_capacity_block_offering_id" {
  description = "(Required) The Capacity Block Reservation ID"
  type        = string
}
variable "ec2_capacity_block_reservation_instance_platform" {
  description = "(Required) The type of operating system for which to reserve capacity. Valid options are Linux/UNIX, Red Hat Enterprise Linux, SUSE Linux, Windows, Windows with SQL Server, Windows with SQL Server Enterprise, Windows with SQL Server Standard or Windows with SQL Server Web"
  type        = string
}
variable "ec2_capacity_block_reservation_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
