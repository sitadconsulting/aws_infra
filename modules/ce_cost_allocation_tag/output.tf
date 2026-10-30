output "ce_cost_allocation_tag_id" {
  description = "The key for the cost allocation tag"
  value       = element(concat(aws_ce_cost_allocation_tag.ce_cost_allocation_tag.*.id, [""]), 0)
}
output "ce_cost_allocation_tag_type" {
  description = "The type of cost allocation tag"
  value       = element(concat(aws_ce_cost_allocation_tag.ce_cost_allocation_tag.*.type, [""]), 0)
}
