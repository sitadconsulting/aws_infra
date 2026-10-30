resource "aws_ce_cost_allocation_tag" "ce_cost_allocation_tag" {
  tag_key = var.ce_cost_allocation_tag_tag_key
  status  = var.ce_cost_allocation_tag_status
}
