output "emr_instance_fleet_id" {
  description = "The unique identifier of the instance fleet"
  value       = element(concat(aws_emr_instance_fleet.emr_instance_fleet.*.id, [""]), 0)
}
output "emr_instance_fleet_provisioned_on_demand_capacity" {
  description = "The number of On-Demand units that have been provisioned for the instance fleet to fulfill TargetOnDemandCapacity. This provisioned capacity might be less than or greater than TargetOnDemandCapacity"
  value       = element(concat(aws_emr_instance_fleet.emr_instance_fleet.*.provisioned_on_demand_capacity, [""]), 0)
}
output "emr_instance_fleet_provisioned_spot_capacity" {
  description = "The number of Spot units that have been provisioned for this instance fleet to fulfill TargetSpotCapacity. This provisioned capacity might be less than or greater than TargetSpotCapacity"
  value       = element(concat(aws_emr_instance_fleet.emr_instance_fleet.*.provisioned_spot_capacity, [""]), 0)
}
output "emr_instance_fleet_status" {
  description = "The current status of the instance fleet"
  value       = element(concat(aws_emr_instance_fleet.emr_instance_fleet.*.status, [""]), 0)
}
