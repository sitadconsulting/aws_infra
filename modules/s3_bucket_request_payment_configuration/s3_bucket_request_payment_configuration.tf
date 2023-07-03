resource "aws_s3_bucket_request_payment_configuration" "s3_bucket_request_payment_configuration" {
  bucket                = var.s3_bucket_request_payment_configuration_bucket
  expected_bucket_owner = var.s3_bucket_request_payment_configuration_expected_bucket_owner 
  payer                 = var.s3_bucket_request_payment_configuration_payer
}
