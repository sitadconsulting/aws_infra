output "autoscalingplans_scaling_plan_id" {
  description = "Scaling plan identifier"
  value       = element(concat(aws_autoscalingplans_scaling_plan.autoscalingplans_scaling_plan.*.id, [""]), 0)
}
output "autoscalingplans_scaling_plan_scaling_plan_version" {
  description = "The version number of the scaling plan. This value is always 1"
  value       = element(concat(aws_autoscalingplans_scaling_plan.autoscalingplans_scaling_plan.*.scaling_plan_version, [""]), 0)
}
