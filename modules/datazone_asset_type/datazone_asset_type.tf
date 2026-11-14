resource "aws_datazone_asset_type" "datazone_asset_type" {
  description               = var.datazone_asset_type_description
  domain_identifier         = var.datazone_asset_type_domain_identifier
  name                      = var.datazone_asset_type_name
  owning_project_identifier = var.datazone_asset_type_owning_project_identifier
  
  dynamic "forms_input" {
    for_each = var.datazone_asset_type_forms_input
      content {
        map_block_key   = forms_input.value["map_block_key"]
        type_identifier = forms_input.value["type_identifier"]
        type_revision   = forms_input.value["type_revision"]
        required        = forms_input.value["required"]
      }
  }
}
