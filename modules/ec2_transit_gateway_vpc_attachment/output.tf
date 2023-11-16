output "ec2_transit_gateway_vpc_attachment_id" {
  description = "EC2 Transit Gateway VPC Attachment identifier"
  value       = element(concat(aws_ec2_transit_gateway_vpc_attachment.ec2_transit_gateway_vpc_attachment.*.id, [""]), 0)
}
output "ec2_transit_gateway_vpc_attachment_vpc_owner_id" {
  description = "Identifier of the AWS account that owns the EC2 VPC"
  value       = element(concat(aws_ec2_transit_gateway_vpc_attachment.ec2_transit_gateway_vpc_attachment.*.vpc_owner_id, [""]), 0)
}
