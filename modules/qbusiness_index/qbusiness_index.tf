resource "awscc_qbusiness_index" "qbusiness_index" {
  application_id                    = var.qbusiness_index_application_id
  description                       = var.qbusiness_index_description
  display_name                      = var.qbusiness_index_display_name
  tags                              = var.qbusiness_index_tags
  type                              = var.qbusiness_index_type
  document_attribute_configurations = var.qbusiness_index_document_attribute_configurations 

  capacity_configuration = {
    units = var.qbusiness_index_capacity_configuration_units
  }
  #document_attribute_configurations = {
  #  name   = var.qbusiness_index_document_attribute_configurations_name
  #  search = var.qbusiness_index_document_attribute_configurations_search
  #  type   = var.qbusiness_index_document_attribute_configurations_type
  #}
}
