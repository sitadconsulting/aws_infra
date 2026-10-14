resource "aws_bedrock_custom_model" "bedrock_custom_model" {
  base_model_identifier   = var.bedrock_custom_model_base_model_identifier
  custom_model_kms_key_id = var.bedrock_custom_model_custom_model_kms_key_id
  custom_model_name       = var.bedrock_custom_model_custom_model_name
  customization_type      = var.bedrock_custom_model_customization_type
  hyperparameters         = var.bedrock_custom_model_hyperparameters
  job_name                = var.bedrock_custom_model_job_name
  role_arn                = var.bedrock_custom_model_role_arn
  tags                    = var.bedrock_custom_model_tags


  dynamic "output_data_config" {
    for_each = var.bedrock_custom_model_output_data_config
      content {
        s3_uri = output_data_config.value["s3_uri"]
      }
  }
  dynamic "training_data_config" {
    for_each = var.bedrock_custom_model_training_data_config
      content {
        s3_uri = training_data_config.value["s3_uri"]
      }
  }
  dynamic "validation_data_config" {
    for_each = var.bedrock_custom_model_validation_data_config
      content {
        dynamic "validator" {
          for_each = validation_data_config.value.validator
            content {
              s3_uri = validator.value["s3_uri"]
            }
        } 
      }
  }
  dynamic "vpc_config" {
    for_each = var.bedrock_custom_model_vpc_config
      content {
        security_group_ids = vpc_config.value["security_group_ids"]
        subnet_ids         = vpc_config.value["subnet_ids"]
      }
  }
}
