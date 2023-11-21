output "sagemaker_image_arn" {
  description = "ARN assigned by AWS to this Image"
  value       = element(concat(aws_sagemaker_image.sagemaker_image.*.arn, [""]), 0)
}
output "sagemaker_image_id" {
  description = "The name of the Image"
  value       = element(concat(aws_sagemaker_image.sagemaker_image.*.id, [""]), 0)
}
