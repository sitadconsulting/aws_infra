output "acmpca_permission_policy" {
  description = "IAM policy that is associated with the permission"
  value       = element(concat(aws_acmpca_permission.acmpca_permission.*.policy, [""]), 0)
}
