output "iam_outbound_web_identity_federation_issuer_identifier" {
  description = "A unique issuer URL for your AWS account that hosts the OpenID Connect (OIDC) discovery endpoints"
  value       = element(concat(aws_iam_outbound_web_identity_federation.iam_outbound_web_identity_federation.*.issuer_identifier, [""]), 0)
}
