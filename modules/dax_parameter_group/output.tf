output "dax_parameter_group_id" {
  description = "The name of the parameter group"
  value       = element(concat(aws_dax_parameter_group.dax_parameter_group.*.id, [""]), 0)
}
