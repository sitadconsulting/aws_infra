output "glue_partition_index_id" {
  description = "Catalog ID, Database name, table name, and index name"
  value       = element(concat(aws_glue_partition_index.glue_partition_index.*.id, [""]), 0)
}
