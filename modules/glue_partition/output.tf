output "glue_partition_id" {
  description = "Partition id"
  value       = element(concat(aws_glue_partition.glue_partition.*.id, [""]), 0)
}
output "glue_partition_creation_time" {
  description = "The time at which the partition was created"
  value       = element(concat(aws_glue_partition.glue_partition.*.creation_time, [""]), 0)
}
output "glue_partition_last_analyzed_time" {
  description = "The last time at which column statistics were computed for this partition"
  value       = element(concat(aws_glue_partition.glue_partition.*.last_analyzed_time, [""]), 0)
}
output "glue_partition_last_accessed_time" {
  description = "The last time at which the partition was accessed"
  value       = element(concat(aws_glue_partition.glue_partition.*.last_accessed_time, [""]), 0)
}
