output "synthetics_canary_arn" {
  description = "ARN of the Canary"
  value       = element(concat(aws_synthetics_canary.synthetics_canary.*.arn, [""]), 0)
}
output "synthetics_canary_engine_arn" {
  description = "ARN of the Lambda function that is used as your canary's engine"
  value       = element(concat(aws_synthetics_canary.synthetics_canary.*.engine_arn, [""]), 0)
}
output "synthetics_canary_id" {
  description = "Name for this canary"
  value       = element(concat(aws_synthetics_canary.synthetics_canary.*.id, [""]), 0)
}
output "synthetics_canary_source_location_arn" {
  description = "ARN of the Lambda layer where Synthetics stores the canary script code"
  value       = element(concat(aws_synthetics_canary.synthetics_canary.*.source_location_arn, [""]), 0)
}
output "synthetics_canary_status" {
  description = "Canary status"
  value       = element(concat(aws_synthetics_canary.synthetics_canary.*.status, [""]), 0)
}
output "synthetics_canary_timeline" {
  description = "Structure that contains information about when the canary was created, modified, and most recently run"
  value       = element(concat(aws_synthetics_canary.synthetics_canary.*.timeline, [""]), 0)
}
