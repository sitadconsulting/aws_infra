resource "aws_dx_connection" "dx_connection" {
  bandwidth       = var.dx_connection_bandwidth
  encryption_mode = var.dx_connection_encryption_mode
  location        = var.dx_connection_location
  name            = var.dx_connection_name
  provider_name   = var.dx_connection_provider_name
  request_macsec  = var.dx_connection_request_macsec
  skip_destroy    = var.dx_connection_skip_destroy
  tags            = var.dx_connection_tags 
}
