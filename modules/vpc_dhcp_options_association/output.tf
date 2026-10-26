output "vpc_dhcp_options_associatio_id" {
  description = "ID of the DHCP Options Set Association"
  value       = element(concat(aws_vpc_dhcp_options_association.vpc_dhcp_options_association.*.id, [""]), 0)
}
