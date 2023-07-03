output "vpc_dhcp_options_id" {
  description = "The ID of DHCP_OPTIONS set"
  value       = element(concat(aws_vpc_dhcp_options.vpc_dhcp_options.*.id, [""]), 0)
}
