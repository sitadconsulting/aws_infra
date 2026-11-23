output "iot_thing_group_arn" {
  description = "The ARN of the Thing Group"
  value       = element(concat(aws_iot_thing_group.iot_thing_group.*.arn, [""]), 0)
}
output "iot_thing_group_id" {
  description = "The Thing Group ID"
  value       = element(concat(aws_iot_thing_group.iot_thing_group.*.id, [""]), 0)
}
output "iot_thing_group_version" {
  description = "The current version of the Thing Group record in the registry"
  value       = element(concat(aws_iot_thing_group.iot_thing_group.*.version, [""]), 0)
}
