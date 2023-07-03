output "s3_bucket_accelerate_configuration_id" {
  description = "The bucket or bucket and expected_bucket_owner separated by a comma (,) if the latter is provided"
  value       = element(concat(aws_s3_bucket_accelerate_configuration.s3_bucket_accelerate_configuration.*.id, [""]), 0)
}
