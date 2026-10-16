output "glue_data_quality_ruleset_arn" {
  description = "ARN of the Glue Data Quality Ruleset"
  value       = element(concat(aws_glue_data_quality_ruleset.glue_data_quality_ruleset.*.arn, [""]), 0)
}
output "glue_data_quality_ruleset_created_on" {
  description = "The time and date that this data quality ruleset was created"
  value       = element(concat(aws_glue_data_quality_ruleset.glue_data_quality_ruleset.*.created_on, [""]), 0)
}
output "glue_data_quality_ruleset_last_modified_on" {
  description = "The time and date that this data quality ruleset was created"
  value       = element(concat(aws_glue_data_quality_ruleset.glue_data_quality_ruleset.*.last_modified_on, [""]), 0)
}
output "glue_data_quality_ruleset_recommendation_run_id" {
  description = "When a ruleset was created from a recommendation run, this run ID is generated to link the two together"
  value       = element(concat(aws_glue_data_quality_ruleset.glue_data_quality_ruleset.*.recommendation_run_id, [""]), 0)
}
