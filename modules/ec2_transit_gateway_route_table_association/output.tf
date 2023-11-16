output "ec2_transit_gateway_route_table_association_id" {
  description = "EC2 Transit Gateway Route Table identifier combined with EC2 Transit Gateway Attachment identifier"
  value       = element(concat(aws_ec2_transit_gateway_route_table_association.ec2_transit_gateway_route_table_association.*.id, [""]), 0)
}
output "ec2_transit_gateway_route_table_association_resource_id" {
  description = "EC2 Transit Gateway Route Table Association Resource Identifier"
  value       = element(concat(aws_ec2_transit_gateway_route_table_association.ec2_transit_gateway_route_table_association.*.resource_id, [""]), 0)
}
output "ec2_transit_gateway_route_table_association_resource_type" {
  description = "EC2 Transit Gateway Route Table Association Resource Type"
  value       = element(concat(aws_ec2_transit_gateway_route_table_association.ec2_transit_gateway_route_table_association.*.resource_type, [""]), 0)
}
