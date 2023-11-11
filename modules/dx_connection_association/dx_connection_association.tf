resource "aws_dx_connection_association" "dx_connection_association" {
  connection_id = var.dx_connection_association_connection_id
  lag_id        = var.dx_connection_association_lag_id
}
