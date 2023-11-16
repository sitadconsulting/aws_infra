output "ec2_transit_gateway_multicast_domain_id" {
  description = "EC2 Transit Gateway Multicast Domain identifier"
  value       = element(concat(aws_ec2_transit_gateway_multicast_domain.ec2_transit_gateway_multicast_domain.*.id, [""]), 0)
}
output "ec2_transit_gateway_arn" {
  description = "EC2 Transit Gateway Multicast Domain ARN"
  value       = element(concat(aws_ec2_transit_gateway_multicast_domain.ec2_transit_gateway_multicast_domain.*.arn, [""]), 0)
}
output "ec2_transit_gateway_owner_id" {
  description = "Identifier of the AWS account that owns the EC2 Transit Gateway Multicast Domain"
  value       = element(concat(aws_ec2_transit_gateway_multicast_domain.ec2_transit_gateway_multicast_domain.*.owner_id, [""]), 0)
}
