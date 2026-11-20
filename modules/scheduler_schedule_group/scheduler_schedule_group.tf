resource "aws_scheduler_schedule_group" "scheduler_schedule_group" {
  name        = var.scheduler_schedule_group_name
  name_prefix = var.scheduler_schedule_group_name_prefix
  tags        = var.scheduler_schedule_group_tags
}
