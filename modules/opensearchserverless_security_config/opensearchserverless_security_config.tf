resource "aws_opensearchserverless_security_config" "opensearchserverless_security_config" {
  description = var.opensearchserverless_security_config_description
  name        = var.opensearchserverless_security_config_name
  type        = var.opensearchserverless_security_config_type


  dynamic "saml_options" {
    for_each = var.opensearchserverless_security_config_saml_options
      content {
        group_attribute = saml_options.value["group_attribute"]
        metadata        = saml_options.value["metadata"]
        session_timeout = saml_options.value["session_timeout"]
        user_attribute  = saml_options.value["user_attribute"]
      }
  }
}
