resource "aws_ssoadmin_customer_managed_policy_attachments_exclusive" "ssoadmin_customer_managed_policy_attachments_exclusive" {
  instance_arn       = var.ssoadmin_customer_managed_policy_attachments_exclusive_instance_arn
  permission_set_arn = var.ssoadmin_customer_managed_policy_attachments_exclusive_permission_set_arn

  dynamic "customer_managed_policy_reference" {
    for_each = var.ssoadmin_customer_managed_policy_attachments_exclusive_customer_managed_policy_reference
      content {
        name = customer_managed_policy_reference.value["name"]
        path = customer_managed_policy_reference.value["path"]
      }
  }
}
