output "s3_object_copy_etag" {
  description = "ETag generated for the object (an MD5 sum of the object content). For plaintext objects or objects encrypted with an AWS-managed key, the hash is an MD5 digest of the object data"
  value       = element(concat(aws_s3_object_copy.s3_object_copy.*.etag, [""]), 0)
}
output "s3_object_copy_expiration" {
  description = "set when object expiration is configured"
  value       = element(concat(aws_s3_object_copy.s3_object_copy.*.expiration, [""]), 0)
}
output "s3_object_copy_id" {
  description = "The key of the resource supplied above"
  value       = element(concat(aws_s3_object_copy.s3_object_copy.*.id, [""]), 0)
}
output "s3_object_copy_last_modified" {
  description = "Returns the date that the object was last modified, in RFC3339 format"
  value       = element(concat(aws_s3_object_copy.s3_object_copy.*.last_modified, [""]), 0)
}
output "s3_object_copy_request_charge" {
  description = "if present, indicates that the requester was successfully charged for the request"
  value       = element(concat(aws_s3_object_copy.s3_object_copy.*.request_charge, [""]), 0)
}
output "s3_object_copy_source_version_id" {
  description = "Version of the copied object in the source bucket"
  value       = element(concat(aws_s3_object_copy.s3_object_copy.*.source_version_id, [""]), 0)
}
output "s3_object_copy_version_id" {
  description = "Version ID of the newly created copy"
  value       = element(concat(aws_s3_object_copy.s3_object_copy.*.version_id, [""]), 0)
}
