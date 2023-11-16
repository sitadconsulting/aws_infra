output "ec2_transit_gateway_peering_attachment_accepter_id" {
  description = "EC2 Transit Gateway Peering Attachment Accepter identifier"
  value       = element(concat(aws_ec2_transit_gateway_peering_attachment_accepter.ec2_transit_gateway_peering_attachment_accepter.*.id, [""]), 0)
}
output "ec2_transit_gateway_peering_attachment_accepter_transit_gateway_id" {
  description = "Identifier of EC2 Transit Gateway"
  value       = element(concat(aws_ec2_transit_gateway_peering_attachment_accepter.ec2_transit_gateway_peering_attachment_accepter.*.transit_gateway_id, [""]), 0)
}
output "ec2_transit_gateway_peering_attachment_accepter_peer_transit_gateway_id" {
  description = "Identifier of EC2 Transit Gateway to peer with"
  value       = element(concat(aws_ec2_transit_gateway_peering_attachment_accepter.ec2_transit_gateway_peering_attachment_accepter.*.peer_transit_gateway_id, [""]), 0)
}
output "ec2_transit_gateway_peering_attachment_accepter_peer_account_id" {
  description = "Identifier of the AWS account that owns the EC2 TGW peering"
  value       = element(concat(aws_ec2_transit_gateway_peering_attachment_accepter.ec2_transit_gateway_peering_attachment_accepter.*.peer_account_id, [""]), 0)
}
