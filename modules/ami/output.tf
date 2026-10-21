output "ami_arn" {
  description = "ARN of the AMI"
  value       = element(concat(aws_ami.ami.*.arn, [""]), 0)
}
output "ami_id" {
  description = "ID of the created AMI"
  value       = element(concat(aws_ami.ami.*.id, [""]), 0)
}
output "ami_owner_id" {
  description = "AWS account ID of the image owner"
  value       = element(concat(aws_ami.ami.*.owner_id, [""]), 0)
}
output "ami_root_snapshot_id" {
  description = "Snapshot ID for the root volume (for EBS-backed AMIs)"
  value       = element(concat(aws_ami.ami.*.root_snapshot_id, [""]), 0)
}
output "ami_usage_operation" {
  description = "Operation of the Amazon EC2 instance and the billing code that is associated with the AMI"
  value       = element(concat(aws_ami.ami.*.usage_operation, [""]), 0)
}
output "ami_platform_details" {
  description = "Platform details associated with the billing code of the AMI"
  value       = element(concat(aws_ami.ami.*.platform_details, [""]), 0)
}
output "ami_image_owner_alias" {
  description = "AWS account alias (for example, amazon, self) or the AWS account ID of the AMI owner"
  value       = element(concat(aws_ami.ami.*.image_owner_alias, [""]), 0)
}
output "ami_image_type" {
  description = "Type of image"
  value       = element(concat(aws_ami.ami.*.image_type, [""]), 0)
}
output "ami_last_launched_time" {
  description = "Date and time, in ISO 8601 date-time format , when the AMI was last used to launch an EC2 instance. When the AMI is used to launch an instance, there is a 24-hour delay before that usage is reported"
  value       = element(concat(aws_ami.ami.*.last_launched_time, [""]), 0)
}
output "ami_image_hypervisor" {
  description = "Hypervisor type of the image"
  value       = element(concat(aws_ami.ami.*.hypervisor, [""]), 0)
}
output "ami_image_platform" {
  description = "This value is set to windows for Windows AMIs; otherwise, it is blank"
  value       = element(concat(aws_ami.ami.*.platform, [""]), 0)
}
output "ami_image_public" {
  description = "Whether the image has public launch permissions"
  value       = element(concat(aws_ami.ami.*.public, [""]), 0)
}
