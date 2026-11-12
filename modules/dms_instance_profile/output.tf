output "dms_instance_profile_arn" {
  description = "ARN of the instance profile"
  value       = element(concat(aws_dms_instance_profile.dms_instance_profile.*.arn, [""]), 0)
}
