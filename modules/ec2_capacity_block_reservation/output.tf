output "ec2_capacity_block_reservation_arn" {
  description = "The ARN of the reservation"
  value       = element(concat(aws_ec2_capacity_block_reservation.ec2_capacity_block_reservation.*.arn, [""]), 0)
}
output "ec2_capacity_block_reservation_availability_zone" {
  description = "The Availability Zone in which to create the Capacity Block Reservation"
  value       = element(concat(aws_ec2_capacity_block_reservation.ec2_capacity_block_reservation.*.availability_zone, [""]), 0)
}
output "ec2_capacity_block_reservation_created_date" {
  description = "The date and time at which the Capacity Block Reservation was created"
  value       = element(concat(aws_ec2_capacity_block_reservation.ec2_capacity_block_reservation.*.created_date, [""]), 0)
}
output "ec2_capacity_block_reservation_ebs_optimized" {
  description = "Indicates whether the Capacity Reservation supports EBS-optimized instances"
  value       = element(concat(aws_ec2_capacity_block_reservation.ec2_capacity_block_reservation.*.ebs_optimized, [""]), 0)
}
output "ec2_capacity_block_reservation_end_date" {
  description = "The date and time at which the Capacity Block Reservation expires. When a Capacity Block Reservation expires, the reserved capacity is released and you can no longer launch instances into it. Valid values: RFC3339 time string (YYYY-MM-DDTHH:MM:SSZ)"
  value       = element(concat(aws_ec2_capacity_block_reservation.ec2_capacity_block_reservation.*.end_date, [""]), 0)
}
output "ec2_capacity_block_reservation_end_date_type" {
  description = "Indicates the way in which the Capacity Reservation ends"
  value       = element(concat(aws_ec2_capacity_block_reservation.ec2_capacity_block_reservation.*.end_date_type, [""]), 0)
}
output "ec2_capacity_block_reservation_id" {
  description = "The ID of the Capacity Block Reservation"
  value       = element(concat(aws_ec2_capacity_block_reservation.ec2_capacity_block_reservation.*.id, [""]), 0)
}
output "ec2_capacity_block_reservation_instance_count" {
  description = "The number of instances for which to reserve capacity. This value will not be set until the Capacity Block Reservation is active. The requested instance count is set in the tag aws:ec2capacityreservation:incrementalRequestedQuantity"
  value       = element(concat(aws_ec2_capacity_block_reservation.ec2_capacity_block_reservation.*.instance_count, [""]), 0)
}
output "ec2_capacity_block_reservation_instance_type" {
  description = "The instance type for which to reserve capacity"
  value       = element(concat(aws_ec2_capacity_block_reservation.ec2_capacity_block_reservation.*.instance_type, [""]), 0)
}
output "ec2_capacity_block_reservation_outpost_arn" {
  description = "The ARN of the Outpost on which to create the Capacity Block Reservation"
  value       = element(concat(aws_ec2_capacity_block_reservation.ec2_capacity_block_reservation.*.outpost_arn, [""]), 0)
}
output "ec2_capacity_block_reservation_placement_group_arn" {
  description = "The ARN of the placement group in which to create the Capacity Block Reservation"
  value       = element(concat(aws_ec2_capacity_block_reservation.ec2_capacity_block_reservation.*.placement_group_arn, [""]), 0)
}
output "ec2_capacity_block_reservation_reservation_type" {
  description = "The type of Capacity Reservation"
  value       = element(concat(aws_ec2_capacity_block_reservation.ec2_capacity_block_reservation.*.reservation_type, [""]), 0)
}
output "ec2_capacity_block_reservation_start_date" {
  description = "The date and time at which the Capacity Block Reservation starts. Valid values: RFC3339 time string (YYYY-MM-DDTHH:MM:SSZ)"
  value       = element(concat(aws_ec2_capacity_block_reservation.ec2_capacity_block_reservation.*.start_date, [""]), 0)
}
output "ec2_capacity_block_reservation_tenancy" {
  description = "Indicates the tenancy of the Capacity Block Reservation. Specify either default or dedicated"
  value       = element(concat(aws_ec2_capacity_block_reservation.ec2_capacity_block_reservation.*.tenancy, [""]), 0)
}
