resource "aws_sagemaker_image" "sagemaker_image" {
  description  = var.sagemaker_image_description
  display_name = var.sagemaker_image_display_name
  image_name   = var.sagemaker_image_image_name
  role_arn     = var.sagemaker_image_role_arn
  tags         = var.sagemaker_image_tags
}
