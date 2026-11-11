output "connect_vocabulary_arn" {
  description = "ARN of the vocabulary"
  value       = element(concat(aws_connect_vocabulary.connect_vocabulary.*.arn, [""]), 0)
}
output "connect_vocabulary_failure_reason" {
  description = "The reason why the custom vocabulary was not created"
  value       = element(concat(aws_connect_vocabulary.connect_vocabulary.*.failure_reason, [""]), 0)
}
output "connect_vocabulary_id" {
  description = "The identifier of the hosting Amazon Connect Instance and identifier of the vocabulary separated by a colon (:)"
  value       = element(concat(aws_connect_vocabulary.connect_vocabulary.*.id, [""]), 0)
}
output "connect_vocabulary_last_modified_time" {
  description = "The timestamp when the custom vocabulary was last modified"
  value       = element(concat(aws_connect_vocabulary.connect_vocabulary.*.last_modified_time, [""]), 0)
}
output "connect_vocabulary_state" {
  description = "The current state of the custom vocabulary. Valid values are CREATION_IN_PROGRESS, ACTIVE, CREATION_FAILED, DELETE_IN_PROGRESS"
  value       = element(concat(aws_connect_vocabulary.connect_vocabulary.*.state, [""]), 0)
}
output "connect_vocabulary_vocabulary_id" {
  description = "The identifier of the custom vocabulary"
  value       = element(concat(aws_connect_vocabulary.connect_vocabulary.*.vocabulary_id, [""]), 0)
}
