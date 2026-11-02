resource "aws_observabilityadmin_telemetry_evaluation" "observabilityadmin_telemetry_evaluation" {
  all_regions = var.observabilityadmin_telemetry_evaluation_all_regions
  regions     = var.observabilityadmin_telemetry_evaluation_regions
}
