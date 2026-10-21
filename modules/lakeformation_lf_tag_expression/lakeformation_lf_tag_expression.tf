resource "aws_lakeformation_lf_tag_expression" "lakeformation_lf_tag_expression" {
  catalog_id   = var.lakeformation_lf_tag_expression_catalog_id
  description  = var.lakeformation_lf_tag_expression_description
  name         = var.lakeformation_lf_tag_expression_name

  dynamic "expression" {
    for_each = var.lakeformation_lf_tag_expression_expression
      content {
        tag_key    = expression.value["tag_key"] 
        tag_values = expression.value["tag_values"]
      }
  }
}
