variable "organizations_organization_enabled_features" {
  description = "(Required) List of IAM features to enable. Valid values are RootCredentialsManagement and RootSessions"
  type        = list(string)
}
