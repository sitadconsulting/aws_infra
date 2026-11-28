resource "aws_macie2_custom_data_identifier" "macie2_custom_data_identifier" {
  description            = var.macie2_custom_data_identifier_description
  ignore_words           = var.macie2_custom_data_identifier_ignore_words
  keywords               = var.macie2_custom_data_identifier_keywords
  maximum_match_distance = var.macie2_custom_data_identifier_maximum_match_distance
  name                   = var.macie2_custom_data_identifier_name
  name_prefix            = var.macie2_custom_data_identifier_name_prefix
  regex                  = var.macie2_custom_data_identifier_regex
  tags                   = var.macie2_custom_data_identifier_tags
}
