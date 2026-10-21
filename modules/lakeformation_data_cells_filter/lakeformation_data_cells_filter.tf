resource "aws_lakeformation_data_cells_filter" "lakeformation_data_cells_filter" {
  dynamic "table_data" {
    for_each = var.lakeformation_data_cells_filter_table_data
      content {
        database_name    = table_data.value["database_name"]
        name             = table_data.value["name"]
        table_catalog_id = table_data.value["table_catalog_id"]
        table_name       = table_data.value["table_name"]
        column_names     = table_data.value["column_names"]
        version_id       = table_data.value["version_id"]
      }
  }
  dynamic "column_wildcard" {
    for_each = var.lakeformation_data_cells_filter_column_wildcard
      content {
        excluded_column_names = column_wildcard.value["excluded_column_names"]
      }
  }
  dynamic "row_filter" {
    for_each = var.lakeformation_data_cells_filter_row_filter
      content {
        all_rows_wildcard = row_filter.value["all_rows_wildcard"]
        filter_expression = row_filter.value["filter_expression"]
      }
  }
}
