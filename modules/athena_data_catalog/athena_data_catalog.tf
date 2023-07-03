resource "aws_athena_data_catalog" "athena_data_catalog" {
  description = var.athena_data_catalog_description
  name        = var.athena_data_catalog_name
  parameters  = var.athena_data_catalog_parameters
  type        = var.athena_data_catalog_type
  tags        = var.athena_data_catalog_tags
}
