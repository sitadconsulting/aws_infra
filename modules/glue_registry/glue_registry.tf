resource "aws_glue_registry" "glue_registry" {
  description   = var.glue_registry_description
  registry_name = var.glue_registry_registry_name
  tags          = var.glue_registry_tags 
}
