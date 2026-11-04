resource "aws_appfabric_app_bundle" "appfabric_app_bundle" {
  customer_managed_key_arn = var.appfabric_app_bundle_customer_managed_key_arn
  tags                     = var.appfabric_app_bundle_tags
}
