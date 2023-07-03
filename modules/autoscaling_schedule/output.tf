output "autoscaling_schedule_arn" {
  description = "ARN assigned by AWS to the autoscaling schedule"
  value       = element(concat(aws_autoscaling_schedule.autoscaling_schedule.*.arn, [""]), 0)
}
