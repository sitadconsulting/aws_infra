output "lb_listener_certificate_id" {
  description = "The listener_arn and certificate_arn separated by a _"
  value       = element(concat(aws_lb_listener_certificate.lb_listener_certificate.*.id, [""]), 0)
}
