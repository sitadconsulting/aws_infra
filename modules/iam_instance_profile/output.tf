output "iam_instance_profile_arn" {
  description = "ARN assigned by AWS to the instance profile"
  value       = element(concat(aws_iam_instance_profile.iam_instance_profile.*.arn, [""]), 0)
}
output "iam_instance_profile_create_date" {
  description = "Creation timestamp of the instance profile"
  value       = element(concat(aws_iam_instance_profile.iam_instance_profile.*.create_date, [""]), 0)
}
output "iam_instance_profile_id" {
  description = "Instance profile's ID"
  value       = element(concat(aws_iam_instance_profile.iam_instance_profile.*.id, [""]), 0)
}
output "iam_instance_profile_unique_id" {
  description = "Unique ID assigned by AWS"
  value       = element(concat(aws_iam_instance_profile.iam_instance_profile.*.unique_id, [""]), 0)
}
