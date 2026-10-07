resource "aws_ssoadmin_customer_managed_policy_attachment" "ssoadmin_customer_managed_policy_attachment" {
  instance_arn       = var.ssoadmin_customer_managed_policy_attachment_instance_arn
  permission_set_arn = var.ssoadmin_customer_managed_policy_attachment_permission_set_arn

 dynamic "customer_managed_policy_reference" {
   for_each = var.ssoadmin_customer_managed_policy_attachment_customer_managed_policy_reference
     content {
       name = customer_managed_policy_reference.value["name"]
       path = customer_managed_policy_reference.value["path"]
     }
  }
}
