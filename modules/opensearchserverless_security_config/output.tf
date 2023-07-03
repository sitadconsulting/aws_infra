output "opensearchserverless_security_config_config_version" {
  description = "Version of the configuration"
  value       = element(concat(aws_opensearchserverless_security_config.opensearchserverless_security_config.*.config_version, [""]), 0)
}
