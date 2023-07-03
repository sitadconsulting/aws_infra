output "s3_bucket_ownership_controls_id" {
  description = "S3 Bucket name"
  value       = element(concat(aws_s3_bucket_ownership_controls.s3_bucket_ownership_controls.*.id, [""]), 0)
}
