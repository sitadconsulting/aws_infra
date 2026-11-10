output "config_retention_configuration_name" {
  description = "he name of the retention configuration object. The object is always named default"
  value       = element(concat(aws_config_retention_configuration.config_retention_configuration.*.name, [""]), 0)
}
