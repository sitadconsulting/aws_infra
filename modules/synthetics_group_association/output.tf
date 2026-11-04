output "synthetics_group_association_group_name" {
  description = "Name of the Group"
  value       = element(concat(aws_synthetics_group_association.synthetics_group_association.*.group_name, [""]), 0)
}
output "synthetics_group_association_group_id" {
  description = "ID of the Group"
  value       = element(concat(aws_synthetics_group_association.synthetics_group_association.*.group_id, [""]), 0)
}
