output "iot_thing_arn" {
  description = "The ARN of the thing"
  value       = element(concat(aws_iot_thing.iot_thing.*.arn, [""]), 0)
}
output "iot_thing_default_client_id" {
  description = "The default client ID"
  value       = element(concat(aws_iot_thing.iot_thing.*.default_client_id, [""]), 0)
}
output "iot_thing_version" {
  description = "The ARN of the thing"
  value       = element(concat(aws_iot_thing.iot_thing.*.version, [""]), 0)
}
