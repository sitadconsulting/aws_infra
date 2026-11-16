resource "aws_datazone_glossary_term" "datazone_glossary_term" {
  domain_identifier   = var.datazone_glossary_term_domain_identifier
  glossary_identifier = var.datazone_glossary_term_glossary_identifier
  long_description    = var.datazone_glossary_term_long_description
  name                = var.datazone_glossary_term_name
  short_description   = var.datazone_glossary_term_short_description
  status              = var.datazone_glossary_term_status

  dynamic "term_relations" {
    for_each = var.datazone_glossary_term_term_relations
      content {
        classifies = term_relations.value["classifies"]
        is_as      = term_relations.value["is_as"]
      }
  }
}
