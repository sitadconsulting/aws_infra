output "ec2_host_id" {
  description = "The ID of the allocated Dedicated Host. This is used to launch an instance onto a specific host"
  value       = element(concat(aws_ec2_host.ec2_host.*.id, [""]), 0)
}
output "ec2_host_arn" {
  description = "The ARN of the Dedicated Host"
  value       = element(concat(aws_ec2_host.ec2_host.*.arn, [""]), 0)
}
output "ec2_host_owner_id" {
  description = "The ID of the AWS account that owns the Dedicated Host"
  value       = element(concat(aws_ec2_host.ec2_host.*.owner_id, [""]), 0)
}
