output "internet_gateway_route_id" {
  description = "The route ID for the internet gateway device"
  value       = element(concat(aws_route.route.*.id, [""]), 0)
}
output "nat_gateway_route_id" {
  description = "The route ID for the NAT gateway device"
  value       = element(concat(aws_route.route.*.id, [""]), 0)
}
output "route_instance_id" {
  description = "Identifier of an EC2 instance"
  value       = element(concat(aws_route.route.*.instance_id, [""]), 0)
}
output "route_instance_owner_id" {
  description = "The AWS account ID of the owner of the EC2 instance"
  value       = element(concat(aws_route.route.*.instance_owner_id, [""]), 0)
}
output "route_origin" {
  description = "How the route was created - CreateRouteTable, CreateRoute or EnableVgwRoutePropagation"
  value       = element(concat(aws_route.route.*.origin, [""]), 0)
}
output "internet_gateway_route_state" {
  description = "The state of the internet gateway route - active or blackhole"
  value       = element(concat(aws_route.route.*.state, [""]), 0)
}
output "nat_gateway_route_state" {
  description = "The state of the nat gateway route - active or blackhole"
  value       = element(concat(aws_route.route.*.state, [""]), 0)
}
