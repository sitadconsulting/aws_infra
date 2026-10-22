output "ec2_instance_connect_endpoint_arn" {
  description = "ARN of the EC2 Instance Connect Endpoint"
  value       = element(concat(aws_ec2_instance_connect_endpoint.ec2_instance_connect_endpoint.*.arn, [""]), 0)
}
output "ec2_instance_connect_endpoint_availability_zone" {
  description = "The Availability Zone of the EC2 Instance Connect Endpoint"
  value       = element(concat(aws_ec2_instance_connect_endpoint.ec2_instance_connect_endpoint.*.availability_zone, [""]), 0)
}
output "ec2_instance_connect_endpoint_dns_name" {
  description = "The DNS name of the EC2 Instance Connect Endpoint"
  value       = element(concat(aws_ec2_instance_connect_endpoint.ec2_instance_connect_endpoint.*.dns_name, [""]), 0)
}
output "ec2_instance_connect_endpoint_fips_dns_name" {
  description = "The DNS name of the EC2 Instance Connect FIPS Endpoint"
  value       = element(concat(aws_ec2_instance_connect_endpoint.ec2_instance_connect_endpoint.*.fips_dns_name, [""]), 0)
}
output "ec2_instance_connect_endpoint_network_interface_ids" {
  description = "The IDs of the ENIs that Amazon EC2 automatically created when creating the EC2 Instance Connect Endpoint"
  value       = element(concat(aws_ec2_instance_connect_endpoint.ec2_instance_connect_endpoint.*.network_interface_ids, [""]), 0)
}
output "ec2_instance_connect_endpoint_owner_id" {
  description = "The ID of the AWS account that created the EC2 Instance Connect Endpoint"
  value       = element(concat(aws_ec2_instance_connect_endpoint.ec2_instance_connect_endpoint.*.owner_id, [""]), 0)
}
output "ec2_instance_connect_endpoint_vpc_id" {
  description = "The ID of the VPC in which the EC2 Instance Connect Endpoint was created"
  value       = element(concat(aws_ec2_instance_connect_endpoint.ec2_instance_connect_endpoint.*.vpc_id, [""]), 0)
}
