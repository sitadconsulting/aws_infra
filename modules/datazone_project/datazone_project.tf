resource "aws_datazone_project" "datazone_project" {
  description         = var.datazone_project_description
  domain_identifier   = var.datazone_project_domain_identifier
  glossary_terms      = var.datazone_project_glossary_terms
  name                = var.datazone_project_name
  skip_deletion_check = var.datazone_project_skip_deletion_check
}
