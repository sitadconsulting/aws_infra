output "rds_cluster_activity_stream_id" {
  description = "ARN of the DB cluster"
  value       = element(concat(aws_rds_cluster_activity_stream.rds_cluster_activity_stream.*.id, [""]), 0)
}
output "rds_cluster_activity_kinesis_stream_name" {
  description = "The name of the Amazon Kinesis data stream to be used for the database activity stream"
  value       = element(concat(aws_rds_cluster_activity_stream.rds_cluster_activity_stream.*.kinesis_stream_name, [""]), 0)
}
