output "ec2_fleet_id" {
  description = "Fleet identifier"
  value       = element(concat(aws_ec2_fleet.ec2_fleet.*.id, [""]), 0)
}
output "ec2_fleet_arn" {
  description = "Fleet ARN"
  value       = element(concat(aws_ec2_fleet.ec2_fleet.*.arn, [""]), 0)
}
output "ec2_fleet_fleet_instance_set" {
  description = "Information about the instances that were launched by the fleet. Available only when type is set to instant"
  value       = element(concat(aws_ec2_fleet.ec2_fleet.*.fleet_instance_set, [""]), 0)
}
output "ec2_fleet_fleet_state" {
  description = "The state of the EC2 Fleet"
  value       = element(concat(aws_ec2_fleet.ec2_fleet.*.fleet_statet, [""]), 0)
}
output "ec2_fleet_fulfilled_capacity" {
  description = "The number of units fulfilled by this request compared to the set target capacity"
  value       = element(concat(aws_ec2_fleet.ec2_fleet.*.fulfilled_capacity, [""]), 0)
}
output "ec2_fleet_fulfilled_on_demand_capacity" {
  description = "The number of units fulfilled by this request compared to the set target On-Demand capacity"
  value       = element(concat(aws_ec2_fleet.ec2_fleet.*.fulfilled_on_demand_capacity, [""]), 0)
}
