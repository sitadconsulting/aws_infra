resource "aws_appfabric_app_authorization_connection" "appfabric_app_authorization_connection" {
  app_authorization_arn = var.appfabric_app_authorization_connection_app_authorization_arn
  app_bundle_arn        = var.appfabric_app_authorization_connection_app_bundle_arn
  

  dynamic "auth_request" {
    for_each = var.appfabric_app_authorization_connection_auth_request
      content {
        code         = auth_request.value["code"]
        redirect_uri = auth_request.value["redirect_uri"]
      }
  }
}
