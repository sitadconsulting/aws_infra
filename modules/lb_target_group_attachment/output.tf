output "lb_target_group_attachment_id" {
  description = "Target group attachment id"
  value       = element(concat(aws_lb_target_group_attachment.lb_target_group_attachment.*.id, [""]), 0)
}
