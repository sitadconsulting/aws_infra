output "dx_lag_arn" {
  description = "LAG ARN"
  value       = element(concat(aws_dx_lag.dx_lag.*.arn, [""]), 0)
}
output "dx_lag_has_logical_redundancy" {
  description = "Indicates whether the LAG supports a secondary BGP peer in the same address family (IPv4/IPv6)"
  value       = element(concat(aws_dx_lag.dx_lag.*.has_logical_redundancy, [""]), 0)
}
output "dx_lag_id" {
  description = "LAG ID"
  value       = element(concat(aws_dx_lag.dx_lag.*.id, [""]), 0)
}
output "dx_lag_jumbo_frame_capable" {
  description = "Indicates whether jumbo frames (9001 MTU) are supported"
  value       = element(concat(aws_dx_lag.dx_lag.*.jumbo_frame_capable, [""]), 0)
}
output "dx_lag_owner_account_id" {
  description = "The ID of the AWS account that owns the LAG"
  value       = element(concat(aws_dx_lag.dx_lag.*.owner_account_id, [""]), 0)
}
