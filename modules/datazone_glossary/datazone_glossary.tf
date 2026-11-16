resource "aws_datazone_glossary" "datazone_glossary" {
  description               = var.datazone_glossary_description
  name                      = var.datazone_glossary_name
  owning_project_identifier = var.datazone_glossary_owning_project_identifier
  status                    = var.datazone_glossary_status
}
