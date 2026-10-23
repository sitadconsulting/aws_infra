resource "aws_placement_group" "placement_group" {
  name            = var.placement_group_name
  partition_count = var.placement_group_partition_count
  spread_level    = var.placement_group_spread_level
  strategy        = var.placement_group_strategy
  tags            = var.placement_group_tags
}
