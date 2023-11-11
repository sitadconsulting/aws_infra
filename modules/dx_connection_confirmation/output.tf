output "dx_connection_confirmation_id" {
  description = "Connection confirmation ID"
  value       = element(concat(aws_dx_connection_confirmation.dx_connection_confirmation.*.id, [""]), 0)
}
