output "iot_authorizer_arn" {
  description = "The ARN of the authorizer"
  value       = element(concat(aws_iot_authorizer.iot_authorizer.*.arn, [""]), 0)
}
