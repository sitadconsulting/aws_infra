resource "aws_bedrock_model_invocation_job" "bedrock_model_invocation_job" {
  job_name                  = var.bedrock_model_invocation_job_job_name
  model_id                  = var.bedrock_model_invocation_job_model_id
  role_arn                  = var.bedrock_model_invocation_job_role_arn 
  skip_destroy              = var.bedrock_model_invocation_job_skip_destroy
  timeout_duration_in_hours = var.bedrock_model_invocation_job_timeout_duration_in_hours

  dynamic "input_data_config" {
    for_each = var.bedrock_model_invocation_job_input_data_config
      content {
        dynamic "s3_input_data_config" {
          for_each = input_data_config.value.s3_input_data_config
            content {
              s3_bucket_owner = s3_input_data_config.value["s3_bucket_owner"]
              s3_input_format = s3_input_data_config.value["s3_input_format"]
              s3_uri          = s3_input_data_config.value["s3_uri"]
            }
        }
      }
  }
  dynamic "output_data_config" {
    for_each = var.bedrock_model_invocation_job_output_data_config
      content {
        dynamic "s3_output_data_config" {
          for_each = output_data_config.value.s3_output_data_config
            content {
              s3_bucket_owner      = s3_output_data_config.value["s3_bucket_owner"]
              s3_encryption_key_id = s3_output_data_config.value["s3_encryption_key_id"]
              s3_uri               = s3_output_data_config.value["s3_uri"]
            }
        }
      }
  }
  dynamic "vpc_config" {
    for_each = var.bedrock_model_invocation_job_vpc_config
      content {
        security_group_ids = vpc_config.value["security_group_ids"]
        subnet_ids         = vpc_config.value["subnet_ids"]
      }
  }
}
