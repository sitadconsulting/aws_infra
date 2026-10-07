resource "aws_ssoadmin_permissions_boundary_attachment" "ssoadmin_permissions_boundary_attachment" {
  instance_arn       = var.ssoadmin_permissions_boundary_attachment_instance_arn
  permission_set_arn = var.ssoadmin_permissions_boundary_attachment_permission_set_arn


  dynamic "permissions_boundary" {
    for_each = var.ssoadmin_permissions_boundary_attachment_permission_boundary
      content {
        managed_policy_arn = permissions_boundary.value["managed_policy_arn"]
        dynamic "customer_managed_policy_reference" {
          for_each = permissions_boundary.value.customer_managed_policy_reference
            content {
              name = customer_managed_policy_reference.value["name"]
              path = customer_managed_policy_reference.value["path"]
            }
        }
      }
  }
}
