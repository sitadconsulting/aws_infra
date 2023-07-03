resource "aws_acmpca_certificate_authority" "certificate_authority" {
  enabled                         = var.certificate_authority_enabled
  usage_mode                      = var.certificate_authority_usage_mode
  tags                            = var.certificate_authority_tags
  type                            = var.certificate_authority_type
  key_storage_security_standard   = var.certificate_authority_key_storage_security_standard
  permanent_deletion_time_in_days = var.certificate_authority_permanent_deletion_time_in_days 


  dynamic "certificate_authority_configuration" {
    for_each = var.certificate_authority_certificate_authority_configuration
      content {
        key_algorithm     = certificate_authority_configuration.value["key_algorithm"]
        signing_algorithm = certificate_authority_configuration.value["signing_algorithm"]
        dynamic "subject" {
          for_each = certificate_authority_configuration.value.subject
            content {
              common_name                  = subject.value["common_name"]
              country                      = subject.value["country"]
              distinguished_name_qualifier = subject.value["distinguished_name_qualifier"]
              generation_qualifier         = subject.value["generation_qualifier"]
              given_name                   = subject.value["given_name"]
              initials                     = subject.value["initials"]
              locality                     = subject.value["locality"]
              organization                 = subject.value["organization"]
              organizational_unit          = subject.value["organizational_unit"]
              pseudonym                    = subject.value["pseudonym"]
              state                        = subject.value["state"]
              surname                      = subject.value["surname"]
              title                        = subject.value["title"]
            }
        }
      }
  }
  dynamic "revocation_configuration" {
    for_each = var.certificate_authority_revocation_configuration
      content {
        dynamic "crl_configuration" {
          for_each = revocation_configuration.value.crl_configuration
            content {
              custom_cname       = crl_configuration.value["custom_cname"]
              enabled            = crl_configuration.value["enabled"]
              expiration_in_days = crl_configuration.value["expiration_in_days"]
              s3_bucket_name     = crl_configuration.value["s3_bucket_name"]
              s3_object_acl      = crl_configuration.value["s3_object_acl"] 
            }
        }
        dynamic "ocsp_configuration" {
          for_each = revocation_configuration.value.ocsp_configuration
            content {
              enabled           = ocsp_configuration.value["enabled"]
              ocsp_custom_cname = ocsp_configuration.value["ocsp_custom_cname"]
            }
        }
      }
  }
}
