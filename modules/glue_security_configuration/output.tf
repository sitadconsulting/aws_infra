output "glue_security_configuration_id" {
  description = "Glue security configuration name"
  value       = element(concat(aws_glue_security_configuration.glue_security_configuration.*.id, [""]), 0)
}
