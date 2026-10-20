resource "aws_iam_saml_provider" "iam_saml_provider" {
  name                   = var.iam_saml_provider_name
  saml_metadata_document = var.iam_saml_provider_saml_metadata_document
  tags                   = var.iam_saml_provider_tags
}
