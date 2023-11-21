output "sagemaker_image_version_arn" {
  description = "ARN assigned by AWS to this Image Version"
  value       = element(concat(aws_sagemaker_image_version.sagemaker_image_version.*.arn, [""]), 0)
}
output "sagemaker_image_version_id" {
  description = "The name of the Image"
  value       = element(concat(aws_sagemaker_image_version.sagemaker_image_version.*.id, [""]), 0)
}
output "sagemaker_image_version_image_arn" {
  description = "ARN of the image the version is based on"
  value       = element(concat(aws_sagemaker_image_version.sagemaker_image_version.*.image_arn, [""]), 0)
}
output "sagemaker_image_version_container_image" {
  description = "The registry path of the container image that contains this image version"
  value       = element(concat(aws_sagemaker_image_version.sagemaker_image_version.*.container_image, [""]), 0)
}
