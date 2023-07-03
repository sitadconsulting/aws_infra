output "quicksight_vpc_connection_arn" {
  description = "ARN of the VPC connection"
  value       = element(concat(aws_quicksight_vpc_connection.quicksight_vpc_connection.*.arn, [""]), 0)
}
output "quicksight_vpc_connection_availability_status" {
  description = "The availability status of the VPC connection. Valid values are AVAILABLE, UNAVAILABLE or PARTIALLY_AVAILABLE"
  value       = element(concat(aws_quicksight_vpc_connection.quicksight_vpc_connection.*.availability_status, [""]), 0)
}
output "quicksight_vpc_connection_id" {
  description = "A comma-delimited string joining AWS account ID and VPC connection ID"
  value       = element(concat(aws_quicksight_vpc_connection.quicksight_vpc_connection.*.id, [""]), 0)
}

