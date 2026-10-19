resource "aws_lb_trust_store" "lb_trust_store" {
  ca_certificates_bundle_s3_bucket         = var.lb_trust_store_ca_certificates_bundle_s3_bucket
  ca_certificates_bundle_s3_key            = var.lb_trust_store_ca_certificates_bundle_s3_key
  ca_certificates_bundle_s3_object_version = var.lb_trust_store_ca_certificates_bundle_s3_object_version 
  name                                     = var.lb_trust_store_name
  name_prefix                              = var.lb_trust_store_name_prefix
  tags                                     = var.lb_trust_store_tags
}
