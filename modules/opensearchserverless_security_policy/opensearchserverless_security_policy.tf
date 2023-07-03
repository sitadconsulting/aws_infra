resource "aws_opensearchserverless_security_policy" "opensearchserverless_security_policy" {
  description = var.opensearchserverless_security_policy_description
  name        = var.opensearchserverless_security_policy_name
  policy      = var.opensearchserverless_security_policy_policy
  type        = var.opensearchserverless_security_policy_type
}
