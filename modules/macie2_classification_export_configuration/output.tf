output "macie2_classification_export_configuration_id" {
  description = "Unique identifier (ID) of the configuration"
  value       = element(concat(aws_macie2_classification_export_configuration.macie2_classification_export_configuration.*.id, [""]), 0)
}
