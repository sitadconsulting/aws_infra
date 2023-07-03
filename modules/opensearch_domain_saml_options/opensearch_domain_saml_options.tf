resource "aws_opensearch_domain_saml_options" "opensearch_domain_saml_options" {
  domain_name = var.opensearch_domain_saml_options_domain_name

  dynamic "saml_options" {
    for_each = var.opensearch_domain_saml_options_saml_options
      content {
        enabled                 = saml_options.value["enabled"]
        master_backend_role     = saml_options.value["master_backend_role"]
        master_user_name        = saml_options.value["master_user_name"]
        roles_key               = saml_options.value["roles_key"]
        session_timeout_minutes = saml_options.value["session_timeout_minutes"]
        subject_key             = saml_options.value["subject_key"]
        dynamic "idp" {
          for_each = saml_options.value.idp
            content {
              entity_id        = idp.value["entity_id"]
              metadata_content = idp.value["metadata_content"]
            }
        }
      }
  }
}
