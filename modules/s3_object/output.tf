output "s3_object_etag" {
  description = "ETag generated for the object (an MD5 sum of the object content). For plaintext objects or objects encrypted with an AWS-managed key, the hash is an MD5 digest of the object data"
  value       = element(concat(aws_s3_object.s3_object.*.etag, [""]), 0)
}
output "s3_object_id" {
  description = "key of the resource"
  value       = element(concat(aws_s3_object.s3_object.*.id, [""]), 0)
}
output "s3_object_version_id" {
  description = "Unique version ID value for the object, if bucket versioning is enabled"
  value       = element(concat(aws_s3_object.s3_object.*.version_id, [""]), 0)
}
