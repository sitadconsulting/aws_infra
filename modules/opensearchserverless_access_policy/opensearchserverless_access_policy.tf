resource "aws_opensearchserverless_access_policy" "opensearchserverless_access_policy" {
  description = var.opensearchserverless_access_policy_description
  name        = var.opensearchserverless_access_policy_name
  policy      = var.opensearchserverless_access_policy_policy
  type        = var.opensearchserverless_access_policy_type
}
