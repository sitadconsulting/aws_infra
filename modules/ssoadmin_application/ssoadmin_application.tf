resource "aws_ssoadmin_application" "ssoadmin_application" {
  application_provider_arn = var.ssoadmin_application_application_provider_arn
  client_token             = var.ssoadmin_application_client_token
  description              = var.ssoadmin_application_description
  name                     = var.ssoadmin_application_name
  instance_arn             = var.ssoadmin_application_instance_arn
  status                   = var.ssoadmin_application_status
  tags                     = var.ssoadmin_application_tags


  dynamic "portal_options" {
    for_each = var.ssoadmin_application_portal_options
      content {
        visibility = portal_options.value["visibility"]
        dynamic "sign_in_options" {
          for_each = portal_options.value.sign_in_options
            content {
              origin          = sign_in_options.value["origin"]
              application_url = sign_in_options.value["application_url"]
            }
        }
      }
  }
}
