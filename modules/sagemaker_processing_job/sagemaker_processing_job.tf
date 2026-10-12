resource "awscc_sagemaker_processing_job" "sagemaker_processing_job" {
  environment              = var.sagemaker_processing_job_environment
  processing_job_name      = var.sagemaker_processing_job_processing_job_name
  role_arn                 = var.sagemaker_processing_job_role_arn
  app_specification        = var.sagemaker_processing_job_app_specification
  experiment_config        = var.sagemaker_processing_job_experiment_config
  network_config           = var.sagemaker_processing_job_network_config
  processing_inputs        = var.sagemaker_processing_job_processing_inputs
  processing_output_config = var.sagemaker_processing_job_processing_output_config
  processing_resources     = var.sagemaker_processing_job_processing_resources
  stopping_condition       = var.sagemaker_processing_job_stopping_condition
  tags                     = var.sagemaker_processing_job_tags
}
