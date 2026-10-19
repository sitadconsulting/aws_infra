output "lb_target_group_arn_suffix" {
  description = "ARN suffix for use with CloudWatch Metrics"
  value       = element(concat(aws_lb_target_group.lb_target_group.*.arn_suffix, [""]), 0)
}
output "lb_target_group_arn" {
  description = "ARN of the Target Group"
  value       = element(concat(aws_lb_target_group.lb_target_group.*.arn, [""]), 0)
}
output "lb_target_group_id" {
  description = "ARN of the Target Group"
  value       = element(concat(aws_lb_target_group.lb_target_group.*.id, [""]), 0)
}
output "lb_target_group_name" {
  description = "Name of the Target Group"
  value       = element(concat(aws_lb_target_group.lb_target_group.*.name, [""]), 0)
}
output "lb_target_group_load_balancer_arns" {
  description = "ARNs of the Load Balancers associated with the Target Group"
  value       = element(concat(aws_lb_target_group.lb_target_group.*.load_balancer_arns, [""]), 0)
}
