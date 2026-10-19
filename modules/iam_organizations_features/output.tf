output "organizations_organization_id" {
  description = "AWS Organization identifier"
  value       = element(concat(aws_organizations_organization.organizations_organization.*.id, [""]), 0)
}
