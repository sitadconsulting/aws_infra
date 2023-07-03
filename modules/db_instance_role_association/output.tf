output "db_instance_role_association_id" {
  description = "DB Instance Identifier and IAM Role ARN separated by a comma"
  value       = element(concat(aws_db_instance_role_association.db_instance_role_association.*.id, [""]), 0)
}
