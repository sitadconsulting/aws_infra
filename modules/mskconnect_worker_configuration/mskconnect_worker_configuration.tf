resource "aws_mskconnect_worker_configuration" "mskconnect_worker_configuration" {
  description             = var.mskconnect_worker_configuration_description 
  name                    = var.mskconnect_worker_configuration_name
  properties_file_content = var.mskconnect_worker_configuration_properties_file_content
}
