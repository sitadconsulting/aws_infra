output "ec2_transit_gateway_policy_table_association_id" {
  description = "EC2 Transit Gateway Policy Table identifier combined with EC2 Transit Gateway Attachment identifier"
  value       = element(concat(aws_ec2_transit_gateway_policy_table_association.ec2_transit_gateway_policy_table_association.*.id, [""]), 0)
}
output "ec2_transit_gateway_policy_table_association_resource_id" {
  description = "Identifier of the resource"
  value       = element(concat(aws_ec2_transit_gateway_policy_table_association.ec2_transit_gateway_policy_table_association.*.resource_id, [""]), 0)
}
output "ec2_transit_gateway_policy_table_association_resource_resource_type" {
  description = "Type of the resource"
  value       = element(concat(aws_ec2_transit_gateway_policy_table_association.ec2_transit_gateway_policy_table_association.*.resource_type, [""]), 0)
}
