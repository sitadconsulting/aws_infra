resource "aws_schemas_discoverer" "schemas_discoverer" {
  description = var.schemas_discoverer_description
  source_arn  = var.schemas_discoverer_source_arn
  tags        = var.schemas_discoverer_tags
}
