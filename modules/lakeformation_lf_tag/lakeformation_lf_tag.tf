resource "aws_lakeformation_lf_tag" "lakeformation_lf_tag" {
  catalog_id  = var.lakeformation_lf_tag_catalog_id
  key         = var.lakeformation_lf_tag_key
  values      = var.lakeformation_lf_tag_values
}
