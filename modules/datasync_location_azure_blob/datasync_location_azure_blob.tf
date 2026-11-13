resource "aws_datasync_location_azure_blob" "datasync_location_azure_blob" {
  access_tier         = var.datasync_location_azure_blob_access_tier
  agent_arns          = var.datasync_location_azure_blob_agent_arns
  authentication_type = var.datasync_location_azure_blob_authentication_type
  blob_type           = var.datasync_location_azure_blob_blob_type
  container_url       = var.datasync_location_azure_blob_container_url
  subdirectory        = var.datasync_location_azure_blob_subdirectory
  tags                = var.datasync_location_azure_blob_tags


  dynamic "sas_configuration" {
    for_each = var.datasync_location_azure_blob_sas_configuration
      content {
        token = sas_configuration.value["token"]
      }
  }
}
