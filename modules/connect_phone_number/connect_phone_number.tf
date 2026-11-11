resource "aws_connect_phone_number" "connect_phone_number" {
  country_code = var.connect_phone_number_country_code
  description  = var.connect_phone_number_description
  prefix       = var.connect_phone_number_prefix
  tags         = var.connect_phone_number_tags
  target_arn   = var.connect_phone_number_target_arn
  type         = var.connect_phone_number_type
}
