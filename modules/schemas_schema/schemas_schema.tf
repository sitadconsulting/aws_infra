resource "aws_schemas_schema" "schemas_schema" {
  content       = var.schemas_schema_content
  description   = var.schemas_schema_description
  name          = var.schemas_schema_name
  registry_name = var.schemas_schema_registry_name
  tags          = var.schemas_schema_tags
  type          = var.schemas_schema_type
}
