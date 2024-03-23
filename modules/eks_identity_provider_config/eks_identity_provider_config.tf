resource "aws_eks_identity_provider_config" "eks_identity_provider_config" {
  cluster_name = var.eks_identity_provider_config_cluster_name
  tags         = var.eks_identity_provider_config_tags

  dynamic "oidc" {
    for_each = var.eks_identity_provider_config_oidc
      content {
        client_id                     = oidc.value["client_id"]
        groups_claim                  = oidc.value["groups_claim"]
        groups_prefix                 = oidc.value["groups_prefix"]
        identity_provider_config_name = oidc.value["identity_provider_config_name"]
        issuer_url                    = oidc.value["issuer_url"]
        required_claims               = oidc.value["required_claims"]
        username_claim                = oidc.value["username_claim"]
        username_prefix               = oidc.value["username_prefix"]
      }
  }
}
