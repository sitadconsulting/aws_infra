output "ebs_volume_copy_arn" {
  description = "ARN of the copied EBS volume"
  value       = element(concat(aws_ebs_volume_copy.ebs_volume_copy.*.arn, [""]), 0)
}
output "ebs_volume_copy_availability_zone" {
  description = "Availability Zone for the copied volume"
  value       = element(concat(aws_ebs_volume_copy.ebs_volume_copy.*.availability_zone, [""]), 0)
}
output "ebs_volume_copy_id" {
  description = "ID of the copied EBS volume"
  value       = element(concat(aws_ebs_volume_copy.ebs_volume_copy.*.id, [""]), 0)
}
