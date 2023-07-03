output "glue_classifier_id" {
  description = "Name of the classifier"
  value       = element(concat(aws_glue_classifier.glue_classifier.*.id, [""]), 0)
}
