output "msk_vpc_connection_arn" {
  description = "ARN of the VPC connection"
  value       = element(concat(aws_msk_vpc_connection.msk_vpc_connection.*.arn, [""]), 0)
}
