resource "aws_lambda_code_signing_config" "lambda_code_signing_config" {
  description = var.lambda_code_signing_config_description

  dynamic "allowed_publishers" {
    for_each = var.lambda_code_signing_config_allowed_publishers
      content {
        signing_profile_version_arns = allowed_publishers.value["signing_profile_version_arns"]
      }
  }

  dynamic "policies" {
    for_each = var.lambda_code_signing_config_policies
      content {
        untrusted_artifact_on_deployment = policies.value["untrusted_artifact_on_deployment"]
      }
  }
}
