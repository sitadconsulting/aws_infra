resource "aws_appfabric_ingestion" "appfabric_ingestion" {
  app            = var.appfabric_ingestion_app
  app_bundle_arn = var.appfabric_ingestion_app_bundle_arn
  ingestion_type = var.appfabric_ingestion_ingestion_type
  tags           = var.appfabric_ingestion_tags
  tenant_id      = var.appfabric_ingestion_tenant_id
}
