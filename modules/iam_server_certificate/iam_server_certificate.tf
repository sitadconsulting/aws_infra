resource "aws_iam_server_certificate" "iam_server_certificate" {
  certificate_body   = var.iam_server_certificate_certificate_body
  certificate_chain  = var.iam_server_certificate_certificate_chain
  name               = var.iam_server_certificate_name
  name_prefix        = var.iam_server_certificate_name_prefix
  path               = var.iam_server_certificate_path
  private_key        = var.iam_server_certificate_private_key
  tags               = var.iam_server_certificate_tags
}
