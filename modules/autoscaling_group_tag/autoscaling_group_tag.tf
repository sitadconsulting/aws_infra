resource "aws_autoscaling_group_tag" "autoscaling_group_tag" {
  autoscaling_group_name = var.autoscaling_group_tag_autoscaling_group_name

  dynamic "tag" {
    for_each = var.autoscaling_group_tag_tag
      content {
        key                 = tag.value["key"]
        propagate_at_launch = tag.value["propagate_at_launch"]
        value               = tag.value["value"]
      }
  }
}
