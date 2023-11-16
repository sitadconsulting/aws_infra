output "ec2_transit_gateway_multicast_group_source_id" {
  description = "Identifier of the default association route table"
  value       = element(concat(aws_ec2_transit_gateway_multicast_group_source.ec2_transit_gateway_multicast_group_source.*.id, [""]), 0)
}
