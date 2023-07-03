variable "rds_reserved_instance_offering_id" {
  description = "ID of the Reserved DB instance offering to purchase. To determine an offering_id, see the aws_rds_reserved_instance_offering data source"
  type        = string
}
variable "rds_reserved_instance_instance_count" {
  description = "Number of instances to reserve. Default value is 1"
  type        = number
  default     = 1
}
variable "rds_reserved_instance_reservation_id" {
  description = "Customer-specified identifier to track this reservation"
  type        = string
  default     = ""
}
variable "rds_reserved_instance_tags" {
  description = "Map of tags to assign to the DB reservation"
  type        = map(string)
  default     = {}
}
