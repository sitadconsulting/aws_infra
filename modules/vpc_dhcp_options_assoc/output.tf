
output "dhcp_options_association_id" {
  description = "The ID of DHCP_OPTIONS Association"
  value       = element(concat(aws_vpc_dhcp_options_association.dhcp_options_association.*.id, [""]), 0)
}
