output "sagemaker_human_task_ui_arn" {
  description = "ARN assigned by AWS to this Human Task UI"
  value       = element(concat(aws_sagemaker_human_task_ui.sagemaker_human_task_ui.*.arn, [""]), 0)
}
output "sagemaker_human_task_ui_id" {
  description = "The name of the Human Task UI"
  value       = element(concat(aws_sagemaker_human_task_ui.sagemaker_human_task_ui.*.id, [""]), 0)
}
output "sagemaker_human_task_ui_ui_template" {
  description = "The Liquid template for the worker user interface"
  value       = element(concat(aws_sagemaker_human_task_ui.sagemaker_human_task_ui.*.ui_template, [""]), 0)
}
