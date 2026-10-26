output "vpc_dhcp_options_arn" {
  description = "ARN of the DHCP Options Set"
  value       = element(concat(aws_vpc_dhcp_options.vpc_dhcp_options.*.arn, [""]), 0)
}
output "vpc_dhcp_options_id" {
  description = "ID of the DHCP Options Set"
  value       = element(concat(aws_vpc_dhcp_options.vpc_dhcp_options.*.id, [""]), 0)
}
output "vpc_dhcp_options_owner_id" {
  description = "ID of the AWS account that owns the DHCP options set"
  value       = element(concat(aws_vpc_dhcp_options.vpc_dhcp_options.*.owner_id, [""]), 0)
}
