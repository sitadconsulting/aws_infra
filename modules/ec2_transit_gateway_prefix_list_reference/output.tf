output "ec2_transit_gateway_prefix_list_reference_id" {
  description = "EC2 Transit Gateway Route Table identifier and EC2 Prefix List identifier, separated by an underscore (_)"
  value       = element(concat(aws_ec2_transit_gateway_prefix_list_reference.ec2_transit_gateway_prefix_list_reference.*.id, [""]), 0)
}
