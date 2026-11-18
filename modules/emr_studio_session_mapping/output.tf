output "emr_studio_session_mapping_id" {
  description = "The ID of the Elastic MapReduce Studio Session Mapping"
  value       = element(concat(aws_emr_studio_session_mapping.emr_studio_session_mapping.*.id, [""]), 0)
}
