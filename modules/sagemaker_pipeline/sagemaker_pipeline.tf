resource "aws_sagemaker_pipeline" "sagemaker_pipeline" {
  pipeline_definition   = var.sagemaker_pipeline_pipeline_definition
  pipeline_description  = var.sagemaker_pipeline_pipeline_description 
  pipeline_display_name = var.sagemaker_pipeline_pipeline_display_name
  pipeline_name         = var.sagemaker_pipeline_pipeline_name
  role_arn              = var.sagemaker_pipeline_role_arn
  tags                  = var.sagemaker_pipeline_tags

  dynamic "parallelism_configuration" {
    for_each = var.sagemaker_pipeline_parallelism_configuration
      content {
        max_parallel_execution_steps = parallelism_configuration.value["max_parallel_execution_steps"]
      }
  }
  dynamic "pipeline_definition_s3_location" {
    for_each = var.sagemaker_pipeline_pipeline_definition_s3_location
      content {
        bucket     = pipeline_definition_s3_location.value["bucket"]
        object_key = pipeline_definition_s3_location.value["object_key"]
        version_id = pipeline_definition_s3_location.value["version_id"]
      }
  }
}
