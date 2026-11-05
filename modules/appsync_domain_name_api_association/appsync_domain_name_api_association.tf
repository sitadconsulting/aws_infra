resource "aws_appsync_domain_name_api_association" "appsync_domain_name_api_association" {
  api_id      = var.appsync_domain_name_api_association_api_id
  domain_name = var.appsync_domain_name_api_association_domain_name
}
