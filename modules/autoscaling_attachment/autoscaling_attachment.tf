resource "aws_autoscaling_attachment" "autoscaling_attachment" {
  autoscaling_group_name = var.autoscaling_attachment_autoscaling_group_name
  elb                    = var.autoscaling_attachment_elb
  lb_target_group_arn    = var.autoscaling_attachment_lb_target_group_arn
}
