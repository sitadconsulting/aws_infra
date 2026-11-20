resource "aws_guardduty_organization_configuration" "guardduty_organization_configuration" {
  auto_enable_organization_members = var.guardduty_organization_configuration_auto_enable_organization_members
  detector_id                      = var.guardduty_organization_configuration_detector_id

  dynamic "datasources" {
    for_each = var.guardduty_organization_configuration_datasources
      content {
        dynamic "kubernetes" {
          for_each = datasources.value.kubernetes
            content {
              dynamic "audit_logs" {
                for_each = kubernetes.value.audit_logs
                  content {
                    enable = audit_logs.value["enable"]
                  }
              }
            }
        }
        dynamic "malware_protection" {
          for_each = datasources.value.malware_protection
            content {
              dynamic "scan_ec2_instance_with_findings" {
                for_each = malware_protection.value.scan_ec2_instance_with_findings
                  content {
                    dynamic "ebs_volumes" {
                      for_each = scan_ec2_instance_with_findings.value.ebs_volumes
                        content {
                          auto_enable = ebs_volumes.value["auto_enable"]
                        }
                    }
                  }
              }
            }
        }
        dynamic "s3_logs" {
          for_each = datasources.value.s3_logs
            content {
              auto_enable = s3_logs.value["auto_enable"]
            }
        }
      }
  }
}
