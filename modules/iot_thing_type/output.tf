output "iot_thing_type_arn" {
  description = "The ARN of the created AWS IoT Thing Type"
  value       = element(concat(aws_iot_thing_type.iot_thing_type.*.arn, [""]), 0)
}
