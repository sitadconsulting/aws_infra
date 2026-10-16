output "glue_ml_transform_arn" {
  description = "ARN of Glue ML Transform"
  value       = element(concat(aws_glue_ml_transform.glue_ml_transform.*.arn, [""]), 0)
}
output "glue_ml_transform_id" {
  description = "Glue ML Transform ID"
  value       = element(concat(aws_glue_ml_transform.glue_ml_transform.*.id, [""]), 0)
}
output "glue_ml_transform_label_count" {
  description = "The number of labels available for this transform"
  value       = element(concat(aws_glue_ml_transform.glue_ml_transform.*.label_count, [""]), 0)
}
output "glue_ml_transform_schema" {
  description = "The object that represents the schema that this transform accepts"
  value       = element(concat(aws_glue_ml_transform.glue_ml_transform.*.schema, [""]), 0)
}
