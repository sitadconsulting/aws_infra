output "sagemaker_device_fleet_id" {
  description = "The name of the Device Fleet"
  value       = element(concat(aws_sagemaker_device_fleet.sagemaker_device_fleet.*.id, [""]), 0)
}
output "sagemaker_device_fleet_arn" {
  description = "ARN assigned by AWS to this Device Fleet"
  value       = element(concat(aws_sagemaker_device_fleet.sagemaker_device_fleet.*.arn, [""]), 0)
}
