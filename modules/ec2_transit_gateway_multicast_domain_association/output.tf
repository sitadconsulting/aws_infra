output "ec2_transit_gateway_multicast_domain_association_id" {
  description = "EC2 Transit Gateway Multicast Domain Association identifier"
  value       = element(concat(aws_ec2_transit_gateway_multicast_domain_association.ec2_transit_gateway_multicast_domain_association.*.id, [""]), 0)
}
