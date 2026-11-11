output "connect_routing_profile_arn" {
  description = "ARN of the Routing Profile"
  value       = element(concat(aws_connect_routing_profile.connect_routing_profile.*.arn, [""]), 0)
}
output "connect_routing_profile_id" {
  description = "Identifier of the hosting Amazon Connect Instance and identifier of the Routing Profile separated by a colon (:)"
  value       = element(concat(aws_connect_routing_profile.connect_routing_profile.*.id, [""]), 0)
}
output "connect_routing_profile_queue_configs" {
  description = "In addition to the arguments used in the queue_configs argument block, there are additional attributes exported within the queue_configs block"
  value       = element(concat(aws_connect_routing_profile.connect_routing_profile.*.queue_configs, [""]), 0)
}
output "connect_routing_profile_routing_profile_id" {
  description = "Identifier for the Routing Profile"
  value       = element(concat(aws_connect_routing_profile.connect_routing_profile.*.routing_profile_id, [""]), 0)
}
