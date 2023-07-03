output "lb_arn" {
  description = "ARN of the listener"
  value       = element(concat(aws_lb_listener.lb_listener.*.arn, [""]), 0)
}

