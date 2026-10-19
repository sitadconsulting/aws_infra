resource "aws_lb_trust_store_revocation" "lb_trust_store_revocation" {
  revocations_s3_bucket         = var.lb_trust_store_revocation_revocations_s3_bucket
  revocations_s3_key            = var.lb_trust_store_revocation_revocations_s3_key
  revocations_s3_object_version = var.lb_trust_store_revocation_revocations_s3_object_version 
  trust_store_arn               = var.lb_trust_store_revocation_trust_store_arn
}
