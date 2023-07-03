output "glue_workflow_arn" {
  description = "ARN of Glue Workflow"
  value       = element(concat(aws_glue_workflow.glue_workflow.*.arn, [""]), 0)
}
output "glue_workflow_id" {
  description = "Workflow name"
  value       = element(concat(aws_glue_workflow.glue_workflow.*.id, [""]), 0)
}
