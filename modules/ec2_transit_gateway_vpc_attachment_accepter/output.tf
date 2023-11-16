output "ec2_transit_gateway_vpc_attachment_accepter_id" {
  description = "EC2 Transit Gateway VPC Attachment Accepter identifier"
  value       = element(concat(aws_ec2_transit_gateway_vpc_attachment_accepter.ec2_transit_gateway_vpc_attachment_accepter.*.id, [""]), 0)
}
output "ec2_transit_gateway_vpc_attachment_accepter_appliance_mode_support" {
  description = "Whether Appliance Mode support is enabled. Valid values: disable, enable" 
  value       = element(concat(aws_ec2_transit_gateway_vpc_attachment_accepter.ec2_transit_gateway_vpc_attachment_accepter.*.appliance_mode_support, [""]), 0)
}
output "ec2_transit_gateway_vpc_attachment_accepter_dns_support" {
  description = "Whether DNS support is enabled. Valid values: disable, enable"
  value       = element(concat(aws_ec2_transit_gateway_vpc_attachment_accepter.ec2_transit_gateway_vpc_attachment_accepter.*.dns_support, [""]), 0)
}
output "ec2_transit_gateway_vpc_attachment_accepter_ipv6_support" {
  description = "Whether IPv6 support is enabled. Valid values: disable, enable"
  value       = element(concat(aws_ec2_transit_gateway_vpc_attachment_accepter.ec2_transit_gateway_vpc_attachment_accepter.*.ipv6_support, [""]), 0)
}
output "ec2_transit_gateway_vpc_attachment_accepter_subnet_ids" {
  description = "Identifiers of EC2 Subnets"
  value       = element(concat(aws_ec2_transit_gateway_vpc_attachment_accepter.ec2_transit_gateway_vpc_attachment_accepter.*.subnet_ids, [""]), 0)
}
output "ec2_transit_gateway_vpc_attachment_accepter_transit_gateway_id" {
  description = "EC2 Transit Gateway Identifier"
  value       = element(concat(aws_ec2_transit_gateway_vpc_attachment_accepter.ec2_transit_gateway_vpc_attachment_accepter.*.transit_gateway_id, [""]), 0)
}
output "ec2_transit_gateway_vpc_attachment_accepter_vpc_id" {
  description = "EC2 VPC Identifier"
  value       = element(concat(aws_ec2_transit_gateway_vpc_attachment_accepter.ec2_transit_gateway_vpc_attachment_accepter.*.vpc_id, [""]), 0)
}
output "ec2_transit_gateway_vpc_attachment_accepter_vpc_owner_id" {
  description = "Identifier of the AWS account that owns the EC2 VPC"
  value       = element(concat(aws_ec2_transit_gateway_vpc_attachment_accepter.ec2_transit_gateway_vpc_attachment_accepter.*.vpc_owner_id, [""]), 0)
}
