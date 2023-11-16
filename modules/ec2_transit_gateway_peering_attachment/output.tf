output "ec2_transit_gateway_peering_attachment_id" {
  description = "EC2 Transit Gateway Peering Attachment identifier"
  value       = element(concat(aws_ec2_transit_gateway_peering_attachment.ec2_transit_gateway_peering_attachment.*.id, [""]), 0)
}
