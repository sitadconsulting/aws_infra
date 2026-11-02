resource "aws_observabilityadmin_telemetry_pipeline" "observabilityadmin_telemetry_pipeline" {
  name = var.observabilityadmin_telemetry_pipeline_name
  tags = var.observabilityadmin_telemetry_pipeline_tags

  dynamic "configuration" {
    for_each = var.observabilityadmin_telemetry_pipeline_configuration
      content {
        body = configuration.value["body"]
      }
  }
}
