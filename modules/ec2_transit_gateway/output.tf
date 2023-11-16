output "ec2_transit_gateway_arn" {
  description = "EC2 Transit Gateway ARN"
  value       = element(concat(aws_ec2_transit_gateway.ec2_transit_gateway.*.arn, [""]), 0)
}
output "ec2_transit_gateway_association_default_route_table_id" {
  description = "Identifier of the default association route table"
  value       = element(concat(aws_ec2_transit_gateway.ec2_transit_gateway.*.association_default_route_table_id, [""]), 0)
}
output "ec2_transit_gateway_id" {
  description = "EC2 Transit Gateway identifier"
  value       = element(concat(aws_ec2_transit_gateway.ec2_transit_gateway.*.id, [""]), 0)
}
output "ec2_transit_gateway_owner_id" {
  description = "Identifier of the AWS account that owns the EC2 Transit Gateway"
  value       = element(concat(aws_ec2_transit_gateway.ec2_transit_gateway.*.owner_id, [""]), 0)
}
output "ec2_transit_gateway_propagation_default_route_table_id" {
  description = "Identifier of the default propagation route table"
  value       = element(concat(aws_ec2_transit_gateway.ec2_transit_gateway.*.propagation_default_route_table_id, [""]), 0)
}
