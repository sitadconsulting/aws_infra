resource "aws_opensearch_domain_policy" "opensearch_domain_policy" {
  access_policies = var.opensearch_domain_policy_access_policies
  domain_name     = var.opensearch_domain_policy_domain_name
}
