resource "aws_datazone_domain" "datazone_domain" {
  description           = var.datazone_domain_description
  domain_execution_role = var.datazone_domain_domain_execution_role
  domain_version        = var.datazone_domain_domain_version
  kms_key_identifier    = var.datazone_domain_kms_key_identifier
  name                  = var.datazone_domain_name
  service_role          = var.datazone_domain_service_role
  skip_deletion_check   = var.datazone_domain_skip_deletion_check

  dynamic "single_sign_on" {
    for_each = var.datazone_domain_single_sign_on
      content {
        idc_instance_arn = single_sign_on.value["idc_instance_arn"]
        type             = single_sign_on.value["type"]
        user_assignment  = single_sign_on.value["user_assignment"]
      }
  }
}
