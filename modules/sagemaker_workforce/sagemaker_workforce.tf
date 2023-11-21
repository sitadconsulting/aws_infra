resource "aws_sagemaker_workforce" "sagemaker_workforce" {
  workforce_name = var.sagemaker_workforce_workforce_name
   
  dynamic "cognito_config" {
    for_each = var.sagemaker_workforce_cognito_config
      content {
        client_id = cognito_config.value["client_id"]
        user_pool = cognito_config.value["user_pool"]
      }
  }
  dynamic "oidc_config" {
    for_each = var.sagemaker_workforce_oidc_config
      content {
        authorization_endpoint = oidc_config.value["authorization_endpoint"]
        client_id              = oidc_config.value["client_id"]
        client_secret          = oidc_config.value["client_secret"]
        issuer                 = oidc_config.value["issuer"]
        jwks_uri               = oidc_config.value["jwks_uri"]
        logout_endpoint        = oidc_config.value["logout_endpoint"]
        token_endpoint         = oidc_config.value["token_endpoint"]
        user_info_endpoint     = oidc_config.value["user_info_endpoint"]
      }
  }
  dynamic "source_ip_config" {
    for_each = var.sagemaker_workforce_source_ip_config
      content {
        cidrs = source_ip_config.value["cidrs"]
      }
  }
  dynamic "workforce_vpc_config" {
    for_each = var.sagemaker_workforce_workforce_vpc_config
      content {
        security_group_ids = workforce_vpc_config.value["security_group_ids"]
        subnets            = workforce_vpc_config.value["subnets"]
        vpc_id             = workforce_vpc_config.value["vpc_id"]
      }
  }
}
