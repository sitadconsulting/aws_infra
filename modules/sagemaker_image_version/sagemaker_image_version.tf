resource "aws_sagemaker_image_version" "sagemaker_image_version" {
  image_name = var.sagemaker_image_version_image_name
  base_image = var.sagemaker_image_version_base_image
}
