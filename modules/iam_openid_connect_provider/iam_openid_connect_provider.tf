resource "aws_iam_openid_connect_provider" "iam_openid_connect_provider" {
  client_id_list  = var.iam_openid_connect_provider_client_id_list
  tags            = var.iam_openid_connect_provider_tags
  thumbprint_list = var.iam_openid_connect_provider_thumbprint_list
  url             = var.iam_openid_connect_provider_url
 
  lifecycle {
    ignore_changes = all
  }
}
