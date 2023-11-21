resource "aws_sagemaker_workteam" "sagemaker_workteam" {
  description    = var.sagemaker_workteam_description
  tags           = var.sagemaker_workteam_tags
  workforce_name = var.sagemaker_workteam_workforce_name
  workteam_name  = var.sagemaker_workteam_workteam_name
  

  dynamic "member_definition" {
    for_each = var.sagemaker_workteam_member_definition
      content {
        dynamic "cognito_member_definition" {
          for_each = member_definition.value.cognito_member_definition
            content {
              client_id  = cognito_member_definition.value["client_id"]
              user_group = cognito_member_definition.value["user_group"]
              user_pool  = cognito_member_definition.value["user_pool"]
            }
        }
        dynamic "oidc_member_definition" {
          for_each = member_definition.value.oidc_member_definition
            content {
              groups = oidc_member_definition.value["groups"]
            }
        }
      }
  }
  dynamic "notification_configuration" {
    for_each = var.sagemaker_workteam_notification_configuration
      content {
        notification_topic_arn = notification_configuration.value["notification_topic_arn"]
      }
  }
}
