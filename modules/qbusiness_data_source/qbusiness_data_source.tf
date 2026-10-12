resource "awscc_qbusiness_data_source" "qbusiness_data_source" {
  application_id                    = var.qbusiness_data_source_application_id
  configuration                     = var.qbusiness_data_source_configuration
  description                       = var.qbusiness_data_source_description
  display_name                      = var.qbusiness_data_source_display_name
  index_id                          = var.qbusiness_data_source_index_id
  role_arn                          = var.qbusiness_data_source_role_arn
  sync_schedule                     = var.qbusiness_data_source_sync_schedule
  tags                              = var.qbusiness_data_source_tags
  document_enrichment_configuration = var.qbusiness_data_source_document_enrichment_configuration
  media_extraction_configuration    = var.qbusiness_data_source_media_extraction_configuration
  vpc_configuration                 = var.qbusiness_data_source_vpc_configuration
}
