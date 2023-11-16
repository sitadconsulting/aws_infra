output "ec2_transit_gateway_policy_table_arn" {
  description = "EC2 Transit Gateway Policy Table ARN"
  value       = element(concat(aws_ec2_transit_gateway_policy_table.ec2_transit_gateway_policy_table.*.arn, [""]), 0)
}
output "ec2_transit_gateway_policy_table_id" {
  description = "EC2 Transit Gateway Policy Table identifier"
  value       = element(concat(aws_ec2_transit_gateway_policy_table.ec2_transit_gateway_policy_table.*.id, [""]), 0)
}
output "ec2_transit_gateway_policy_table_state" {
  description = "The state of the EC2 Transit Gateway Policy Table"
  value       = element(concat(aws_ec2_transit_gateway_policy_table.ec2_transit_gateway_policy_table.*.state, [""]), 0)
}
