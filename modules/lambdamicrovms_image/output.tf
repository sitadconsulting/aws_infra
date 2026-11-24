output "lambdamicrovms_image_arn" {
  description = "ARN of the Image"
  value       = element(concat(aws_lambdamicrovms_image.lambdamicrovms_image.*.arn, [""]), 0)
}
output "lambdamicrovms_image_created_at" {
  description = "RFC3339 timestamp when the image was created"
  value       = element(concat(aws_lambdamicrovms_image.lambdamicrovms_image.*.created_at, [""]), 0)
}
output "lambdamicrovms_image_image_version" {
  description = "Current version of the image"
  value       = element(concat(aws_lambdamicrovms_image.lambdamicrovms_image.*.image_version, [""]), 0)
}
output "lambdamicrovms_image_latest_active_image_version" {
  description = "Latest active version of the image"
  value       = element(concat(aws_lambdamicrovms_image.lambdamicrovms_image.*.latest_active_image_version, [""]), 0)
}
output "lambdamicrovms_image_latest_failed_image_version" {
  description = "Latest failed version of the image, if any"
  value       = element(concat(aws_lambdamicrovms_image.lambdamicrovms_image.*.latest_failed_image_version, [""]), 0)
}
output "lambdamicrovms_image_state" {
  description = "Current state of the image (e.g., CREATED)"
  value       = element(concat(aws_lambdamicrovms_image.lambdamicrovms_image.*.state, [""]), 0)
}
output "lambdamicrovms_image_updated_at" {
  description = "RFC3339 timestamp when the image was last updated"
  value       = element(concat(aws_lambdamicrovms_image.lambdamicrovms_image.*.updated_at, [""]), 0)
}
