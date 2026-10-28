output "athena_capacity_reservation_allocated_dpus" {
  description = "Number of data processing units currently allocated"
  value       = element(concat(aws_athena_capacity_reservation.athena_capacity_reservation.*.allocated_dpus, [""]), 0)
}
output "athena_capacity_reservation_arn" {
  description = "ARN of the Capacity Reservation"
  value       = element(concat(aws_athena_capacity_reservation.athena_capacity_reservation.*.arn, [""]), 0)
}
output "athena_capacity_reservation_status" {
  description = "Status of the capacity reservation"
  value       = element(concat(aws_athena_capacity_reservation.athena_capacity_reservation.*.status, [""]), 0)
}
