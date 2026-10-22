output "ec2_instance_state_id" {
  description = "ID of the instance (matches instance_id)"
  value       = element(concat(aws_ec2_instance_state.ec2_instance_state.*.id, [""]), 0)
}
