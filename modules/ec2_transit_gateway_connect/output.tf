output "ec2_transit_gateway_connect_id" {
  description = "EC2 Transit Gateway Attachment identifier"
  value       = element(concat(aws_ec2_transit_gateway_connect.ec2_transit_gateway_connect.*.id, [""]), 0)
}
