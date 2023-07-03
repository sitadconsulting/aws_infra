output "autoscaling_group_tag_id" {
  description = "Auto Scaling Group name and key separated by comma"
  value       = element(concat(aws_autoscaling_group_tag.autoscaling_group_tag.*.id, [""]), 0)
}
