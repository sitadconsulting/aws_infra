resource "aws_dx_lag" "dx_lag" {
  connection_id         = var.dx_lag_connection_id
  connections_bandwidth = var.dx_lag_connections_bandwidth
  force_destroy         = var.dx_lag_force_destroy
  location              = var.dx_lag_location
  name                  = var.dx_lag_name
  provider_name         = var.dx_lag_provider_name
  tags                  = var.dx_lag_tags 
}
