output "ami_copy_arn" {
  description = "ARN of the AMI"
  value       = element(concat(aws_ami_copy.ami_copy.*.arn, [""]), 0)
}
output "ami_copy_id" {
  description = "D of the created AMI"
  value       = element(concat(aws_ami_copy.ami_copy.*.id, [""]), 0)
}
