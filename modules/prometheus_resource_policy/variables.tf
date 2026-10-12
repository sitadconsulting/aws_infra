variable "prometheus_resource_policy_policy_document" {
  description = "(Required) The JSON policy document to use as the resource-based policy. This policy defines the permissions that other AWS accounts or services have to access your workspace"
  type        = string
}
variable "prometheus_resource_policy_workspace_id" {
  description = "(Required) The ID of the workspace to attach the resource-based policy to"
  type        = string
}
