resource "aws_msk_configuration" "msk_configuration" {
  description       = var.msk_configuration_description 
  kafka_versions    = var.msk_configuration_kafka_versions
  name              = var.msk_configuration_name
  server_properties = var.msk_configuration_server_properties
}
