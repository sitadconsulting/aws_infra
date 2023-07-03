output "glue_user_defined_function_id" {
  description = "The id of the Glue User Defined Function"
  value       = element(concat(aws_glue_user_defined_function.glue_user_defined_function.*.id, [""]), 0)
}
output "glue_user_defined_function_arn" {
  description = "ARN of the Glue User Defined Function"
  value       = element(concat(aws_glue_user_defined_function.glue_user_defined_function.*.arn, [""]), 0)
}
