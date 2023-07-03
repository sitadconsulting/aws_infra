output "internet_gateway_route_id" {
  description = "The route ID for the internet gateway device"
  value       = element(concat(aws_route.route.*.id, [""]), 0)
}
output "nat_gateway_route_id" {
  description = "The route ID for the NAT gateway device"
  value       = element(concat(aws_route.route.*.id, [""]), 0)
}
output "internet_gateway_route_state" {
  description = "The state of the internet gateway route - active or blackhole"
  value       = element(concat(aws_route.route.*.state, [""]), 0)
}
output "nat_gateway_route_state" {
  description = "The state of the nat gateway route - active or blackhole"
  value       = element(concat(aws_route.route.*.state, [""]), 0)
}
