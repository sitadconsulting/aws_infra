resource "aws_lb_target_group_attachment" "lb_target_group_attachment" {
  port              = var.lb_target_group_attachment_port
  quic_server_id    = var.lb_target_group_attachment_quic_server_id
  availability_zone = var.lb_target_group_attachment_availability_zone
  target_group_arn  = var.lb_target_group_attachment_target_group_arn
  target_id         = var.lb_target_group_attachment_target_id
}
