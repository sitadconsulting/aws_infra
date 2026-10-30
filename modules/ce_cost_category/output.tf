output "ce_cost_category_arn" {
  description = "ARN of the cost category"
  value       = element(concat(aws_ce_cost_category.ce_cost_category.*.arn, [""]), 0)
}
output "ce_cost_category_effective_end" {
  description = "Effective end data of your Cost Category"
  value       = element(concat(aws_ce_cost_category.ce_cost_category.*.effective_end, [""]), 0)
}
output "ce_cost_category_id" {
  description = "Unique ID of the cost category"
  value       = element(concat(aws_ce_cost_category.ce_cost_category.*.id, [""]), 0)
}
