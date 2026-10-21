output "ami_from_instance_arn" {
  description = "ARN of the AMI"
  value       = element(concat(aws_ami_from_instance.ami_from_instance.*.arn, [""]), 0)
}
output "ami_from_instance_id" {
  description = "ID of the created AMI"
  value       = element(concat(aws_ami_from_instance.ami_from_instance.*.id, [""]), 0)
}
