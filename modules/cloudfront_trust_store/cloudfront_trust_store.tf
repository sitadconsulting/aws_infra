resource "aws_cloudfront_trust_store" "cloudfront_trust_store" {
  name = var.cloudfront_trust_store_name
  tags = var.cloudfront_trust_store_tags

  dynamic "ca_certificates_bundle_source" {
    for_each = var.cloudfront_trust_store_ca_certificates_bundle_source
      content {
        dynamic "ca_certificates_bundle_s3_location" {
          for_each = ca_certificates_bundle_source.value.ca_certificates_bundle_s3_location
            content {
              bucket  = ca_certificates_bundle_s3_location.value["bucket"]
              key     = ca_certificates_bundle_s3_location.value["key"]
              region  = ca_certificates_bundle_s3_location.value["region"]
              version = ca_certificates_bundle_s3_location.value["version"]
            }
        }
      }
  }
}
