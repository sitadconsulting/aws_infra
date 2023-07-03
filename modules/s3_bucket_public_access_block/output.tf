output "s3_bucket_public_access_block_id" {
  description = "Name of the S3 bucket the configuration is attached to"
  value       = element(concat(aws_s3_bucket_public_access_block.s3_bucket_public_access_block.*.id, [""]), 0)
}
