resource "aws_lambda_capacity_provider" "lambda_capacity_provider" {
  name        = var.lambda_capacity_provider_name
  kms_key_arn = var.lambda_capacity_provider_kms_key_arn
  tags        = var.lambda_capacity_provider_tags

  dynamic "capacity_provider_scaling_config" {
    for_each = var.lambda_capacity_provider_capacity_provider_scaling_config
      content {
        max_vcpu_count = capacity_provider_scaling_config.value["max_vcpu_count"]
        scaling_mode   = capacity_provider_scaling_config.value["scaling_mode"]
        dynamic "scaling_policies" {
          for_each = capacity_provider_scaling_config.value.scaling_policies
            content {
              predefined_metric_type = scaling_policies.value["predefined_metric_type"]
              target_value           = scaling_policies.value["target_value"]
            }
        }
      }
  }
  dynamic "instance_requirements" {
    for_each = var.lambda_capacity_provider_instance_requirements
      content {
        allowed_instance_types  = instance_requirements.value["allowed_instance_types"]
        architectures           = instance_requirements.value["architectures"]
        excluded_instance_types = instance_requirements.value["excluded_instance_types"] 
      }
  }
  dynamic "permissions_config" {
    for_each = var.lambda_capacity_provider_permissions_config
      content {
        capacity_provider_operator_role_arn = permissions_config.value["capacity_provider_operator_role_arn"]
      }
  }
  dynamic "vpc_config" {
    for_each = var.lambda_capacity_provider_vpc_config
      content {
        security_group_ids = vpc_config.value["security_group_ids"]
        subnet_ids         = vpc_config.value["subnet_ids"]
      }
  }
}
