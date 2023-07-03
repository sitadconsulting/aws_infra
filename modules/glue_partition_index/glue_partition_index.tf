resource "aws_glue_partition_index" "glue_partition_index" {
  catalog_id     = var.glue_partition_index_catalog_id
  database_name  = var.glue_partition_index_database_name
  table_name     = var.glue_partition_index_table_name

  dynamic "partition_index" {
    for_each = var.glue_partition_index_partition_index
      content {

      }
  }
}
