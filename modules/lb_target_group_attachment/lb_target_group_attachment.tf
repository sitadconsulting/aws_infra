resource "aws_lb_target_group_attachment" "lb_target_group_attachment" {
  target_group_arn  = var.lb_target_group_attachment_target_group_arn
  target_id         = var.lb_target_group_attachment_target_id
  port              = var.lb_target_group_attachment_port
  availability_zone = var.lb_target_group_attachment_availability_zone
}
