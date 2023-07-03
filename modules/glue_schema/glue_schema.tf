resource "aws_glue_schema" "glue_schema" {
  compatibility     = var.glue_schema_compatibility
  data_format       = var.glue_schema_data_format
  description       = var.glue_schema_description
  registry_arn      = var.glue_schema_registry_arn
  schema_name       = var.glue_schema_schema_name
  schema_definition = var.glue_schema_schema_definition
  tags              = var.glue_schema_tags
}
