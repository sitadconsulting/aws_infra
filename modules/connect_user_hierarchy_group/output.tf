output "connect_user_hierarchy_group_arn" {
  description = "ARN of the hierarchy group"
  value       = element(concat(aws_connect_user_hierarchy_group.connect_user_hierarchy_group.*.arn, [""]), 0)
}
output "connect_user_hierarchy_group_hierarchy_group_id" {
  description = "The identifier for the hierarchy group"
  value       = element(concat(aws_connect_user_hierarchy_group.connect_user_hierarchy_group.*.hierarchy_group_id, [""]), 0)
}
output "connect_user_hierarchy_group_hierarchy_path" {
  description = "A block that contains information about the levels in the hierarchy group"
  value       = element(concat(aws_connect_user_hierarchy_group.connect_user_hierarchy_group.*.hierarchy_path, [""]), 0)
}
output "connect_user_hierarchy_group_id" {
  description = "The identifier of the hosting Amazon Connect Instance and identifier of the hierarchy group separated by a colon (:)"
  value       = element(concat(aws_connect_user_hierarchy_group.connect_user_hierarchy_group.*.id, [""]), 0)
}
output "connect_user_hierarchy_group_level_id" {
  description = "The identifier of the level in the hierarchy group"
  value       = element(concat(aws_connect_user_hierarchy_group.connect_user_hierarchy_group.*.level_id, [""]), 0)
}
