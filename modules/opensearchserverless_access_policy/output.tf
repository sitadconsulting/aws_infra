output "opensearchserverless_access_policy_policy_version" {
  description = "Version of the policy"
  value       = element(concat(aws_opensearchserverless_access_policy.opensearchserverless_access_policy.*.policy_version, [""]), 0)
}

