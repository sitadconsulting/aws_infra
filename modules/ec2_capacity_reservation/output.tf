output "ec2_capacity_reservation_id" {
  description = "The Capacity Reservation ID"
  value       = element(concat(aws_ec2_capacity_reservation.ec2_capacity_reservation.*.id, [""]), 0)
}
output "ec2_capacity_reservation_owner_id" {
  description = "The ID of the AWS account that owns the Capacity Reservation"
  value       = element(concat(aws_ec2_capacity_reservation.ec2_capacity_reservation.*.owner_id, [""]), 0)
}
output "ec2_capacity_reservation_arn" {
  description = "The ARN of the Capacity Reservation"
  value       = element(concat(aws_ec2_capacity_reservation.ec2_capacity_reservation.*.arn, [""]), 0)
}
