resource "aws_vpclattice_target_group_attachment" "vpclattice_target_group_attachment" {
  target_group_identifier = var.vpclattice_target_group_attachment_target_group_identifier

  dynamic "target" {
    for_each = var.vpclattice_target_group_attachment_target
      content {
        id   = target.value["id"]
        port = target.value["port"]
      }
   }
}
