resource "aws_networkflowmonitor_scope" "networkflowmonitor_scope" {
  tags = var.networkflowmonitor_scope_tags
  
  dynamic "target" {
    for_each = var.networkflowmonitor_scope_target
      content {
        region = target.value["region"]
        dynamic "target_identifier" {
          for_each = target.value.target_identifier
            content {
              target_type = target_identifier.value["target_type"]
              dynamic "target_id" {
                for_each = target_identifier.value.target_id
                  content {
                    account_id = target_id.value["account_id"]
                  }
              }
            }
        } 
      }
  }
}
