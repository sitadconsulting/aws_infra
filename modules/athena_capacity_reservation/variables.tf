variable "athena_capacity_reservation_name" {
  description = "(Required) Name of the capacity reservation"
  type        = string
}
variable "athena_capacity_reservation_target_dpus" {
  description = "(Required) Number of data processing units requested. Must be at least 24 units"
  type        = number
}
variable "athena_capacity_reservation_tags" {
  description = "(Optional) Map of tags assigned to the resource"
  type        = map(string)
  default     = {}
}
