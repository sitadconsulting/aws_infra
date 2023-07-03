output "opensearchserverless_security_policy_policy_version" {
  description = "Version of the policy"
  value       = element(concat(aws_opensearchserverless_security_policy.opensearchserverless_security_policy.*.policy_version, [""]), 0)
}
