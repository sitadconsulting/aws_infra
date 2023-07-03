output "rds_reserved_instance_arn" {
  description = "ARN for the reserved DB instance"
  value       = element(concat(aws_rds_reserved_instance.rds_reserved_instance.*.arn, [""]), 0)
}
output "rds_reserved_instance_id" {
  description = "Unique identifier for the reservation. same as reservation_id"
  value       = element(concat(aws_rds_reserved_instance.rds_reserved_instance.*.id, [""]), 0)
}
output "rds_reserved_instance_currency_code" {
  description = "Currency code for the reserved DB instance"
  value       = element(concat(aws_rds_reserved_instance.rds_reserved_instance.*.currency_code, [""]), 0)
}
output "rds_reserved_instance_duration" {
  description = "Duration of the reservation in seconds"
  value       = element(concat(aws_rds_reserved_instance.rds_reserved_instance.*.duration, [""]), 0)
}
output "rds_reserved_instance_fixed_price" {
  description = "Fixed price charged for this reserved DB instance"
  value       = element(concat(aws_rds_reserved_instance.rds_reserved_instance.*.fixed_price, [""]), 0)
}
output "rds_reserved_instance_db_instance_class" {
  description = "DB instance class for the reserved DB instance"
  value       = element(concat(aws_rds_reserved_instance.rds_reserved_instance.*.db_instance_class, [""]), 0)
}
output "rds_reserved_instance_lease_id" {
  description = "Unique identifier for the lease associated with the reserved DB instance"
  value       = element(concat(aws_rds_reserved_instance.rds_reserved_instance.*.lease_id, [""]), 0)
}
output "rds_reserved_instance_multi_az" {
  description = "Whether the reservation applies to Multi-AZ deployments"
  value       = element(concat(aws_rds_reserved_instance.rds_reserved_instance.*.multi_az, [""]), 0)
}
output "rds_reserved_instance_offering_type" {
  description = "Offering type of this reserved DB instance"
  value       = element(concat(aws_rds_reserved_instance.rds_reserved_instance.*.offering_type, [""]), 0)
}
output "rds_reserved_instance_product_description" {
  description = "Description of the reserved DB instance"
  value       = element(concat(aws_rds_reserved_instance.rds_reserved_instance.*.product_description, [""]), 0)
}
output "rds_reserved_instance_recurring_charges" {
  description = "Recurring price charged to run this reserved DB instance"
  value       = element(concat(aws_rds_reserved_instance.rds_reserved_instance.*.recurring_charges, [""]), 0)
}
output "rds_reserved_instance_start_time" {
  description = "Time the reservation started"
  value       = element(concat(aws_rds_reserved_instance.rds_reserved_instance.*.start_time, [""]), 0)
}
output "rds_reserved_instance_state" {
  description = "State of the reserved DB instance"
  value       = element(concat(aws_rds_reserved_instance.rds_reserved_instance.*.state, [""]), 0)
}
output "rds_reserved_instance_usage_price" {
  description = "Hourly price charged for this reserved DB instance"
  value       = element(concat(aws_rds_reserved_instance.rds_reserved_instance.*.usage_price, [""]), 0)
}
