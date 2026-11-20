resource "aws_schemas_registry" "schemas_registry" {
  description = var.schemas_registry_description
  name        = var.schemas_registry_name
  tags        = var.schemas_registry_tags
}
