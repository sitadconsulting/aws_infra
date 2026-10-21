output "lakeformation_data_cells_filter_id" {
  description = "Provider composed identifier: database_name,name,table_catalog_id,table_name"
  value       = element(concat(aws_lakeformation_data_cells_filter.lakeformation_data_cells_filter.*.id, [""]), 0)
}
