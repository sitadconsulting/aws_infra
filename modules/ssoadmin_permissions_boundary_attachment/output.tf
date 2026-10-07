output "ssoadmin_permissions_boundary_attachment_id" {
  description = "Permission Set Amazon Resource Name (ARN) and SSO Instance ARN, separated by a comma (,)"
  value       = element(concat(aws_ssoadmin_permissions_boundary_attachment.ssoadmin_permissions_boundary_attachment.*.id, [""]), 0)
}
