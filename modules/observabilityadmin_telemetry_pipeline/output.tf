output "observabilityadmin_telemetry_pipeline_arn" {
  description = "ARN of the telemetry pipeline"
  value       = element(concat(aws_observabilityadmin_telemetry_pipeline.observabilityadmin_telemetry_pipeline.*.arn, [""]), 0)
}
