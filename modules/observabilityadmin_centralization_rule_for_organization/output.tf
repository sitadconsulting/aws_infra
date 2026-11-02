output "observabilityadmin_centralization_rule_for_organization_rule_arn" {
  description = "ARN of the centralization rule"
  value       = element(concat(aws_observabilityadmin_centralization_rule_for_organization.observabilityadmin_centralization_rule_for_organization.*.rule_arn, [""]), 0)
}
output "observabilityadmin_centralization_rule_for_organization_tag_propagation_status" {
  description = "Health status of tag propagation for the rule (for example, Healthy or Unhealthy). Independent of the overall rule health"
  value       = element(concat(aws_observabilityadmin_centralization_rule_for_organization.observabilityadmin_centralization_rule_for_organization.*.tag_propagation_status, [""]), 0)
}
output "observabilityadmin_centralization_rule_for_organization_tag_propagation_failure_reason" {
  description = "Reason tag propagation is unhealthy, when applicable (for example, RoleNotAssumable or RoleLacksPermissions)"
  value       = element(concat(aws_observabilityadmin_centralization_rule_for_organization.observabilityadmin_centralization_rule_for_organization.*.tag_propagation_failure_reason, [""]), 0)
}
