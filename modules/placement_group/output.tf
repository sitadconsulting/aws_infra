output "placement_group_arn" {
  description = "ARN of the placement group"
  value       = element(concat(aws_placement_group.placement_group.*.arn, [""]), 0)
}
output "placement_group_id" {
  description = "Name of the placement group"
  value       = element(concat(aws_placement_group.placement_group.*.id, [""]), 0)
}
output "placement_group_placement_group_id" {
  description = "ID of the placement group"
  value       = element(concat(aws_placement_group.placement_group.*.placement_group_id, [""]), 0)
}
