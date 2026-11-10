output "connect_instance_arn" {
  description = "ARN of the instance"
  value       = element(concat(aws_connect_instance.connect_instance.*.arn, [""]), 0)
}
output "connect_instance_created_time" {
  description = "When the instance was created"
  value       = element(concat(aws_connect_instance.connect_instance.*.created_time, [""]), 0)
}
output "connect_instance_id" {
  description = "The identifier of the instance" 
  value       = element(concat(aws_connect_instance.connect_instance.*.id, [""]), 0)
}
output "connect_instance_service_role" {
  description = "The service role of the instance"
  value       = element(concat(aws_connect_instance.connect_instance.*.service_role, [""]), 0)
}
output "connect_instance_status" {
  description = "The state of the instance"
  value       = element(concat(aws_connect_instance.connect_instance.*.status, [""]), 0)
}
