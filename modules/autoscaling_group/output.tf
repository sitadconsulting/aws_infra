output "autoscaling_group_id" {
  description = "Auto Scaling Group id"
  value       = element(concat(aws_autoscaling_group.autoscaling_group.*.id, [""]), 0)
}
output "autoscaling_group_arn" {
  description = "ARN of this autoscaling group"
  value       = element(concat(aws_autoscaling_group.autoscaling_group.*.arn, [""]), 0)
}
output "autoscaling_group_availability_zones" {
  description = "Availability zones of the Auto Scaling Group"
  value       = element(concat(aws_autoscaling_group.autoscaling_group.*.availability_zones, [""]), 0)
}
output "autoscaling_group_min_size" {
  description = "Minimum size of the Auto Scaling Group"
  value       = element(concat(aws_autoscaling_group.autoscaling_group.*.min_size, [""]), 0)
}
output "autoscaling_group_max_size" {
  description = "Maximum size of the Auto Scaling Group"
  value       = element(concat(aws_autoscaling_group.autoscaling_group.*.max_size, [""]), 0)
}
output "autoscaling_group_default_instance_warmup" {
  description = "The duration of the default instance warmup, in seconds"
  value       = element(concat(aws_autoscaling_group.autoscaling_group.*.default_instance_warmup, [""]), 0)
}
output "autoscaling_group_name" {
  description = "Name of the Auto Scaling Group"
  value       = element(concat(aws_autoscaling_group.autoscaling_group.*.name, [""]), 0)
}
output "autoscaling_group_health_check_grace_period" {
  description = "Time after instance comes into service before checking health"
  value       = element(concat(aws_autoscaling_group.autoscaling_group.*.health_check_grace_period, [""]), 0)
}
output "autoscaling_group_health_check_type" {
  description = "EC2 or ELB. Controls how health checking is done"
  value       = element(concat(aws_autoscaling_group.autoscaling_group.*.health_check_type, [""]), 0)
}
output "autoscaling_group_desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group"
  value       = element(concat(aws_autoscaling_group.autoscaling_group.*.desired_capacity, [""]), 0)
} 
output "autoscaling_group_vpc_zone_identifier" {
  description = "The VPC zone identifier"
  value       = element(concat(aws_autoscaling_group.autoscaling_group.*.vpc_zone_identifier, [""]), 0)
} 
