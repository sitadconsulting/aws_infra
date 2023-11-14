resource "aws_cognito_identity_pool_roles_attachment" "cognito_identity_pool_roles_attachment" {
  identity_pool_id = var.cognito_identity_pool_roles_attachment_identity_pool_id
  roles            = var.cognito_identity_pool_roles_attachment_roles

  dynamic "role_mapping" {
    for_each = var.cognito_identity_pool_roles_attachment_role_mapping
      content {
        identity_provider         = role_mapping.value["identity_provider"]
        ambiguous_role_resolution = role_mapping.value["ambiguous_role_resolution"]
        type                      = role_mapping.value["type"]
        dynamic "mapping_rule" {
          for_each = role_mapping.value.mapping_rule
            content {
              claim      = mapping_rule.value["claim"]
              match_type = mapping_rule.value["match_type"]
              role_arn   = mapping_rule.value["role_arn"]
              value      = mapping_rule.value["value"] 
            }
        } 
      }
  }
}
