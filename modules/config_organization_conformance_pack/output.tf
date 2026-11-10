output "config_organization_conformance_pack_arn" {
  description = "ARN of the organization conformance pack"
  value       = element(concat(aws_config_organization_conformance_pack.config_organization_conformance_pack.*.arn, [""]), 0)
}
