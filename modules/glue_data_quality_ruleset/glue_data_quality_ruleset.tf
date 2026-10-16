resource "aws_glue_data_quality_ruleset" "glue_data_quality_ruleset" {
  description = var.glue_data_quality_ruleset_description
  name        = var.glue_data_quality_ruleset_name
  ruleset     = var.glue_data_quality_ruleset_ruleset
  tags        = var.glue_data_quality_ruleset_tags


  dynamic "target_table" {
    for_each = var.glue_data_quality_ruleset_target_table
      content {
        catalog_id    = target_table.value["catalog_id"]
        database_name = target_table.value["database_name"]
        table_name    = target_table.value["table_name"]
      }
  }
}
