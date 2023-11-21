output "sagemaker_device_id" {
  description = "The id is constructed from device-fleet-name/device-name"
  value       = element(concat(aws_sagemaker_device.sagemaker_device.*.id, [""]), 0)
}
output "sagemaker_device_arn" {
  description = "ARN assigned by AWS to this Device"
  value       = element(concat(aws_sagemaker_device.sagemaker_device.*.arn, [""]), 0)
}
