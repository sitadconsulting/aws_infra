output "opensearch_domain_saml_options_id" {
  description = "Name of the domain the SAML options are associated with"
  value       = element(concat(aws_opensearch_domain_saml_options.opensearch_domain_saml_options.*.id, [""]), 0)
}
