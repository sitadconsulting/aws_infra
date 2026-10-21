output "lakeformation_lf_tag_id" {
  description = "Catalog ID and key-name of the tag"
  value       = element(concat(aws_lakeformation_lf_tag.lakeformation_lf_tag.*.id, [""]), 0)
}
