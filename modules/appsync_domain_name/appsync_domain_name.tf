resource "aws_appsync_domain_name" "appsync_domain_name" {
  certificate_arn = var.appsync_domain_name_certificate_arn
  description     = var.appsync_domain_name_description
  domain_name     = var.appsync_domain_name_domain_name
}
