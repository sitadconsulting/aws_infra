resource "aws_datasync_location_object_storage" "datasync_location_object_storage" {
  agent_arns         = var.datasync_location_object_storage_agent_arns
  access_key         = var.datasync_location_object_storage_access_key
  bucket_name        = var.datasync_location_object_storage_bucket_name
  secret_key         = var.datasync_location_object_storage_secret_key
  server_certificate = var.datasync_location_object_storage_server_certificate
  server_hostname    = var.datasync_location_object_storage_server_hostname
  server_protocol    = var.datasync_location_object_storage_server_protocol
  server_port        = var.datasync_location_object_storage_server_port
  subdirectory       = var.datasync_location_object_storage_subdirectory
  tags               = var.datasync_location_object_storage_tags
}
