resource "aws_sagemaker_notebook_instance_lifecycle_configuration" "sagemaker_notebook_instance_lifecycle_configuration" {
  name      = var.sagemaker_notebook_instance_lifecycle_configuration_name
  on_create = var.sagemaker_notebook_instance_lifecycle_configuration_on_create
  on_start  = var.sagemaker_notebook_instance_lifecycle_configuration_on_start
}
