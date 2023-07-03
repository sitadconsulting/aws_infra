resource "aws_db_proxy" "db_proxy" {
  name                   = var.db_proxy_name
  debug_logging          = var.db_proxy_debug_logging
  engine_family          = var.db_proxy_engine_family
  idle_client_timeout    = var.db_proxy_idle_client_timeout
  require_tls            = var.db_proxy_require_tls
  role_arn               = var.db_proxy_role_arn
  vpc_security_group_ids = var.db_proxy_vpc_security_group_ids
  vpc_subnet_ids         = var.db_proxy_vpc_subnet_ids
  tags                   = var.db_proxy_tags

  dynamic "auth" {
    for_each = var.db_proxy_auth
      content {
         auth_scheme               = auth.value["auth_scheme"]
         client_password_auth_type = auth.value["client_password_auth_type"]
         description               = auth.value["description"]
         iam_auth                  = auth.value["iam_auth"]
         secret_arn                = auth.value["secret_arn"]
         username                  = auth.value["secret_arn"]
      }
  }
  timeouts {
    create = "30m"
    delete = "60m"
    update = "30m"
  }
}
