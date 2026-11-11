output "connect_user_hierarchy_structure_arn" {
  description = "The ARN of the hierarchy level"
  value       = element(concat(aws_connect_user_hierarchy_structure.connect_user_hierarchy_structure.*.arn, [""]), 0)
}
output "connect_user_hierarchy_structure_hierarchy_structure" {
  description = "In addition to the arguments defined initially, there are attributes added to the levels created"
  value       = element(concat(aws_connect_user_hierarchy_structure.connect_user_hierarchy_structure.*.hierarchy_structure, [""]), 0)
}
output "connect_user_hierarchy_structure_id" {
  description = "The identifier of the hosting Amazon Connect Instance"
  value       = element(concat(aws_connect_user_hierarchy_structure.connect_user_hierarchy_structure.*.id, [""]), 0)
}
