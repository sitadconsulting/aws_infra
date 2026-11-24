output "lambdamicrovms_microvm_endpoint" {
  description = "HTTPS endpoint URL for communicating with the MicroVM"
  value       = element(concat(aws_lambdamicrovms_microvm.lambdamicrovms_microvm.*.endpoint, [""]), 0)
}
output "lambdamicrovms_microvm_microvm_id" {
  description = "Unique identifier of the MicroVM"
  value       = element(concat(aws_lambdamicrovms_microvm.lambdamicrovms_microvm.*.microvm_id, [""]), 0)
}
output "lambdamicrovms_microvm_started_at" {
  description = "Timestamp when the MicroVM first started, in RFC 3339 format"
  value       = element(concat(aws_lambdamicrovms_microvm.lambdamicrovms_microvm.*.started_at, [""]), 0)
}
output "lambdamicrovms_microvm_state" {
  description = "Current lifecycle state of the MicroVM (e.g., RUNNING)"
  value       = element(concat(aws_lambdamicrovms_microvm.lambdamicrovms_microvm.*.state, [""]), 0)
}
