resource "awscc_sagemaker_model_package" "sagemaker_model_package" {
  approval_description                       = var.sagemaker_model_package_approval_description
  certify_for_marketplace                    = var.sagemaker_model_package_certify_for_marketplace
  client_token                               = var.sagemaker_model_package_client_token
  customer_metadata_properties               = var.sagemaker_model_package_customer_metadata_properties
  domain                                     = var.sagemaker_model_package_domain
  model_approval_status                      = var.sagemaker_model_package_model_approval_status
  model_package_description                  = var.sagemaker_model_package_model_package_description
  model_package_group_name                   = var.sagemaker_model_package_model_package_group_name
  model_package_name                         = var.sagemaker_model_package_model_package_name
  model_package_version                      = var.sagemaker_model_package_model_package_version
  sample_payload_url                         = var.sagemaker_model_package_sample_payload_url
  skip_model_validation                      = var.sagemaker_model_package_skip_model_validation
  source_uri                                 = var.sagemaker_model_package_source_uri
  task                                       = var.sagemaker_model_package_task
  additional_inference_specifications        = var.sagemaker_model_package_additional_inference_specifications
  additional_inference_specifications_to_add = var.sagemaker_model_package_additional_inference_specifications_to_add
  drift_check_baselines                      = var.sagemaker_model_package_drift_check_baselines
  inference_specification                    = var.sagemaker_model_package_inference_specification
  metadata_properties                        = var.sagemaker_model_package_metadata_properties
  model_card                                 = var.sagemaker_model_package_model_card
  model_metrics                              = var.sagemaker_model_package_model_metrics
  model_package_status_details               = var.sagemaker_model_package_model_package_status_details
  security_config                            = var.sagemaker_model_package_security_config
  source_algorithm_specification             = var.sagemaker_model_package_source_algorithm_specification
  tags                                       = var.sagemaker_model_package_tags
  validation_specification                   = var.sagemaker_model_package_validation_specification
}
