output "lb_arn" {
  description = "ARN of the LB"
  value       = element(concat(aws_lb.lb.*.arn, [""]), 0)
}
output "lb_arn_suffix" {
  description = "ARN suffix for use with CloudWatch Metrics."
  value       = element(concat(aws_lb.lb.*.arn_suffix, [""]), 0)
}
output "lb_dns_name" {
  description = "DNS name of the load balancer"
  value       = element(concat(aws_lb.lb.*.dns_name, [""]), 0)
}
output "lb_zone_id" {
  description = "The canonical hosted zone ID of the load balancer (to be used in a Route 53 Alias record)"
  value       = element(concat(aws_lb.lb.*.zone_id, [""]), 0)
}
