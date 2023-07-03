output "s3_bucket_acl_id" {
  description = "The bucket, expected_bucket_owner (if configured), and acl (if configured) separated by commas (,)"
  value       = element(concat(aws_s3_bucket_acl.s3_bucket_acl.*.id, [""]), 0)
}
