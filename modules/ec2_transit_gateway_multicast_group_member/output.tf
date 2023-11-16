output "ec2_transit_gateway_multicast_group_member_id" {
  description = "EC2 Transit Gateway Multicast Group Member identifier"
  value       = element(concat(aws_ec2_transit_gateway_multicast_group_member.ec2_transit_gateway_multicast_group_member.*.id, [""]), 0)
}
