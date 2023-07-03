resource "aws_db_proxy_default_target_group" "db_proxy_default_target_group" {
  db_proxy_name = var.db_proxy_default_target_group_db_proxy_name

  dynamic "connection_pool_config" {
    for_each = var.db_proxy_default_target_group_connection_pool_config
      content {
        connection_borrow_timeout    = connection_pool_config.value["connection_borrow_timeout"]
        init_query                   = connection_pool_config.value["init_query"]
        max_connections_percent      = connection_pool_config.value["max_connections_percent"]
        max_idle_connections_percent = connection_pool_config.value["max_idle_connections_percent"]
        dynamic "session_pinning_filters" {
          for_each = connection_pool_config.value.session_pinning_filters
            content {
              type = session_pinning_filters.value["type"]
            }
        }
      }
  }
  timeouts {
    create = "30m"
    update = "30m"
  }
}
