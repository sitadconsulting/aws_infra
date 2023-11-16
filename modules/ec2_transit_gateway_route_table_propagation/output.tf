output "ec2_transit_gateway_route_table_propagation_id" {
  description = "EC2 Transit Gateway Route Table Propagation identifier combined with EC2 Transit Gateway Attachment identifier"
  value       = element(concat(aws_ec2_transit_gateway_route_table_propagation.ec2_transit_gateway_route_table_propagation.*.id, [""]), 0)
}
output "ec2_transit_gateway_route_table_propagation_resource_id" {
  description = "EC2 Transit Gateway Route Table Propagation Resource Identifier"
  value       = element(concat(aws_ec2_transit_gateway_route_table_propagation.ec2_transit_gateway_route_table_propagation.*.resource_id, [""]), 0)
}
output "ec2_transit_gateway_route_table_propagation_resource_type" {
  description = "EC2 Transit Gateway Route Table Propagation Resource Type"
  value       = element(concat(aws_ec2_transit_gateway_route_table_propagation.ec2_transit_gateway_route_table_propagation.*.resource_type, [""]), 0)
}
