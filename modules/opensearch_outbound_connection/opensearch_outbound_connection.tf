resource "aws_opensearch_outbound_connection" "opensearch_outbound_connection" {
  connection_alias = var.opensearch_outbound_connection_connection_alias

  dynamic "local_domain_info" {
    for_each = var.opensearch_outbound_connection_local_domain_info
      content {
        owner_id    = local_domain_info.value["owner_id"]
        domain_name = local_domain_info.value["domain_name"]
        region      = local_domain_info.value["region"]
      }
  }
  dynamic "remote_domain_info" {
    for_each = var.opensearch_outbound_connection_remote_domain_info
      content {
        owner_id    = remote_domain_info.value["owner_id"]
        domain_name = remote_domain_info.value["domain_name"]
        region      = remote_domain_info.value["region"]
        
      }
  }
}
