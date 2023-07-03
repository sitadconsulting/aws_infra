resource "aws_lb_listener_certificate" "lb_listener_certificate" {
  listener_arn    = var.lb_listener_certificate_listener_arn
  certificate_arn = var.lb_listener_certificate_certificate_arn
}
