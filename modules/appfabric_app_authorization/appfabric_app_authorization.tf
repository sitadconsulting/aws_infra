resource "aws_appfabric_app_authorization" "appfabric_app_authorization" {
  app            = var.appfabric_app_authorization_app
  app_bundle_arn = var.appfabric_app_authorization_app_bundle_arn
  auth_type      = var.appfabric_app_authorization_auth_type
  tags           = var.appfabric_app_authorization_tags


  dynamic "credential" {
    for_each = var.appfabric_app_authorization_credential
      content {
        dynamic "api_key_credential" {
          for_each = credential.value.api_key_credential
            content {
              api_key = api_key_credential.value["api_key"]
            }
        }
        dynamic "oauth2_credential" {
          for_each = credential.value.oauth2_credential
            content {
              client_id     = oauth2_credential.value["client_id"]
              client_secret = oauth2_credential.value["client_secret"]
            }
        }
      }
  }
  dynamic "tenant" {
    for_each = var.appfabric_app_authorization_tenant
      content {
        tenant_display_name = tenant.value["tenant_display_name"]
        tenant_identifier   = tenant.value["tenant_identifier"]
      }
  }
}
