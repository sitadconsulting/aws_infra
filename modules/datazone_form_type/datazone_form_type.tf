resource "aws_datazone_form_type" "datazone_form_type" {
  description               = var.datazone_form_type_description
  domain_identifier         = var.datazone_form_type_domain_identifier
  name                      = var.datazone_form_type_name
  owning_project_identifier = var.datazone_form_type_owning_project_identifier
  status                    = var.datazone_form_type_status

  dynamic "model" {
    for_each = var.datazone_form_type_model
      content {
        smithy = model.value["smithy"]
      }
  }
}
