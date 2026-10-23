output "spot_fleet_request_id" {
  description = "The Spot fleet request ID"
  value       = element(concat(aws_spot_fleet_request.spot_fleet_request.*.id, [""]), 0)
}
output "spot_fleet_request_spot_request_state" {
  description = "The state of the Spot fleet request"
  value       = element(concat(aws_spot_fleet_request.spot_fleet_request.*.spot_request_state, [""]), 0)
}
