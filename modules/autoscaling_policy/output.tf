output "autoscaling_policy_arn" {
  description = "ARN assigned by AWS to the scaling policy"
  value       = element(concat(aws_autoscaling_policy.autoscaling_policy.*.arn, [""]), 0)
}
output "autoscaling_policy_name" {
  description = "Scaling policy's name"
  value       = element(concat(aws_autoscaling_policy.autoscaling_policy.*.name, [""]), 0)
}
output "autoscaling_policy_autoscaling_group_name" {
  description = "The scaling policy's assigned autoscaling group"
  value       = element(concat(aws_autoscaling_policy.autoscaling_policy.*.autoscaling_group_name, [""]), 0)
}
output "autoscaling_policy_adjustment_type" {
  description = "Scaling policy's adjustment type"
  value       = element(concat(aws_autoscaling_policy.autoscaling_policy.*.adjustment_type, [""]), 0)
}
output "autoscaling_policy_policy_type" {
  description = "Scaling policy's type"
  value       = element(concat(aws_autoscaling_policy.autoscaling_policy.*.policy_type, [""]), 0)
}
