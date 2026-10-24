output "ec2_managed_prefix_list_arn" {
  description = "ARN of the prefix list"
  value       = element(concat(aws_ec2_managed_prefix_list.ec2_managed_prefix_list.*.arn, [""]), 0)
}
output "ec2_managed_prefix_list_id" {
  description = "ID of the prefix list"
  value       = element(concat(aws_ec2_managed_prefix_list.ec2_managed_prefix_list.*.id, [""]), 0)
}
output "ec2_managed_prefix_list_owner_id" {
  description = " ID of the AWS account that owns this prefix list"
  value       = element(concat(aws_ec2_managed_prefix_list.ec2_managed_prefix_list.*.owner_id, [""]), 0)
}
output "ec2_managed_prefix_list_version" {
  description = "Latest version of this prefix list"
  value       = element(concat(aws_ec2_managed_prefix_list.ec2_managed_prefix_list.*.version, [""]), 0)
}
