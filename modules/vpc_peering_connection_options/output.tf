output "vpc_peering_connection_options_id" {
  description = "ID of the VPC Peering Connection Options"
  value       = element(concat(aws_vpc_peering_connection_options.vpc_peering_connection_options.*.id, [""]), 0)
}
