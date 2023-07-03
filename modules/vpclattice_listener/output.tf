output "vpclattice_listener_arn" {
  description = "ARN of the listener"
  value       = element(concat(aws_vpclattice_listener.vpclattice_listener.*.arn, [""]), 0)
}
output "vpclattice_created_at" {
  description = "Date and time that the listener was created, specified in ISO-8601 format"
  value       = element(concat(aws_vpclattice_listener.vpclattice_listener.*.created_at, [""]), 0)
}
output "vpclattice_listener_id" {
  description = "Standalone ID of the listener"
  value       = element(concat(aws_vpclattice_listener.vpclattice_listener.*.listener_id, [""]), 0)
}
output "vpclattice_updated_at" {
  description = "Date and time that the listener was last updated, specified in ISO-8601 format"
  value       = element(concat(aws_vpclattice_listener.vpclattice_listener.*.updated_at, [""]), 0)
}
