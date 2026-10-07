output "grafana_workspace_arn" {
  description = "ARN of the Grafana workspace"
  value       = element(concat(aws_grafana_workspace.grafana_workspace.*.arn, [""]), 0)
}
output "grafana_workspace_id" {
  description = "ID of the Grafana workspace"
  value       = element(concat(aws_grafana_workspace.grafana_workspace.*.id, [""]), 0)
}
output "grafana_workspace_endpoint" {
  description = "The endpoint of the Grafana workspace"
  value       = element(concat(aws_grafana_workspace.grafana_workspace.*.endpoint, [""]), 0)
}
output "grafana_workspace_grafana_version" {
  description = "The version of Grafana running on the workspace"
  value       = element(concat(aws_grafana_workspace.grafana_workspace.*.grafana_version, [""]), 0)
}
