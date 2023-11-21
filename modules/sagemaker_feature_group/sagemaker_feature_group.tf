resource "aws_sagemaker_feature_group" "sagemaker_feature_group" {
  description                    = var.sagemaker_feature_group_description
  event_time_feature_name        = var.sagemaker_feature_group_event_time_feature_name
  feature_group_name             = var.sagemaker_feature_group_feature_group_name 
  record_identifier_feature_name = var.sagemaker_feature_group_record_identifier_feature_name 
  role_arn                       = var.sagemaker_feature_group_role_arn
  tags                           = var.sagemaker_feature_group_tags

  dynamic "feature_definition" {
    for_each = var.sagemaker_feature_group_feature_definition
      content {
        feature_name = feature_definition.value["feature_name"]
        feature_type = feature_definition.value["feature_type"]
      }
  }
  dynamic "offline_store_config" {
    for_each = var.sagemaker_feature_group_offline_store_config
      content {
        disable_glue_table_creation = offline_store_config.value["disable_glue_table_creation"]
        table_format                = offline_store_config.value["table_format"]
        dynamic "data_catalog_config" {
          for_each = offline_store_config.value.data_catalog_config
            content {
              catalog    = data_catalog_config.value["catalog"]
              database   = data_catalog_config.value["database"]
              table_name = data_catalog_config.value["table_name"]
            }
        } 
        dynamic "s3_storage_config" {
          for_each = offline_store_config.value.s3_storage_config
            content {
              kms_key_id             = s3_storage_config.value["kms_key_id"]
              resolved_output_s3_uri = s3_storage_config.value["resolved_output_s3_uri"]
              s3_uri                 = s3_storage_config.value["s3_uri"]
            }
        }
      }
  }
  dynamic "online_store_config" {
    for_each = var.sagemaker_feature_group_online_store_config
      content {
        enable_online_store = online_store_config.value["enable_online_store"]
        storage_type        = online_store_config.value["storage_type"]
        dynamic "security_config" {
          for_each = online_store_config.value.security_config
            content {
              kms_key_id = security_config.value["kms_key_id"]
            }
        }
        dynamic "ttl_duration" {
          for_each = online_store_config.value.ttl_duration
            content {
              unit  = ttl_duration.value["unit"]
              value = ttl_duration.value["value"]
            }
        }
      }
  }
}
