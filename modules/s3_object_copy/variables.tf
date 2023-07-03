variable "s3_object_copy_acl" {
  description = "Canned ACL to apply. Defaults to private. Valid values are private, public-read, public-read-write, authenticated-read, aws-exec-read, bucket-owner-read, and bucket-owner-full-control. Conflicts with grant"
  type        =  string
  default     =  ""
}
variable "s3_object_copy_bucket" {
  description = "Name of the bucket to put the file in"
  type        = string
}
variable "s3_object_copy_cache_control" {
  description = "Specifies caching behavior along the request/reply chain"
  type        = string
  default     = ""
}
variable "s3_object_copy_content_disposition" {
  description = "Specifies presentational information for the object"
  type        = string
  default     = ""
}
variable "s3_object_copy_content_encoding" {
  description = "Specifies what content encodings have been applied to the object and thus what decoding mechanisms must be applied to obtain the media-type referenced by the Content-Type header field"
  type        = string
  default     = ""
}
variable "s3_object_copy_content_language" {
  description = "Language the content is in e.g., en-US or en-GB"
  type        = string
  default     = ""
}
variable "s3_object_copy_content_type" {
  description = "Standard MIME type describing the format of the object data, e.g., application/octet-stream. All Valid MIME Types are valid for this input"
  type        = string
  default     = ""
}
variable "s3_object_copy_copy_if_match" {
  description = "Copies the object if its entity tag (ETag) matches the specified tag"
  type        = string
  default     = ""
}
variable "s3_object_copy_copy_if_modified_since" {
  description = "Copies the object if it has been modified since the specified time"
  type        = string
  default     = ""
}
variable "s3_object_copy_copy_if_none_match" {
  description = "Copies the object if its entity tag (ETag) is different than the specified ETag"
  type        = string
  default     = ""
}
variable "s3_object_copy_copy_if_unmodified_since" {
  description = "Copies the object if it hasn't been modified since the specified time, in RFC3339 format"
  type        = string
  default     = ""
}
variable "s3_object_copy_customer_algorithm" {
  description = "Specifies the algorithm to use to when encrypting the object (for example, AES256)"
  type        = string
  default     = ""
}
variable "s3_object_copy_customer_key" {
  description = "Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon S3 does not store the encryption key. The key must be appropriate for use with the algorithm specified in the x-amz-server-side-encryption-customer-algorithm header"
  type        = string
  default     = ""
}
variable "s3_object_copy_customer_key_md5" {
  description = "Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure that the encryption key was transmitted without error"
  type        = string
  default     = ""
}
variable "s3_object_copy_expected_bucket_owner" {
  description = "Account id of the expected destination bucket owner. If the destination bucket is owned by a different account, the request will fail with an HTTP 403 (Access Denied) error "
  type        = string
  default     = ""
}
variable "s3_object_copy_expected_source_bucket_owner" {
  description = "Account id of the expected source bucket owner. If the source bucket is owned by a different account, the request will fail with an HTTP 403 (Access Denied) error"
  type        = string
  default     = ""
}
variable "s3_object_copy_expires" {
  description = "Date and time at which the object is no longer cacheable, in RFC3339 format"
  type        = string
  default     = ""
}
variable "s3_object_copy_force_destroy" {
  description = "Allow the object to be deleted by removing any legal hold on any object version. Default is false. This value should be set to true only if the bucket has S3 object lock enabled"
  type        = bool
  default     = false
}
variable "s3_object_copy_key" {
  description = "Name of the object once it is in the bucket"
  type        = string
}
variable "s3_object_copy_kms_encryption_context" {
  description = "Specifies the AWS KMS Encryption Context to use for object encryption. The value is a base64-encoded UTF-8 string holding JSON with the encryption context key-value pairs"
  type        = string
  default     = ""
}
variable "s3_object_copy_kms_key_id" {
  description = "Specifies the AWS KMS Key ARN to use for object encryption. This value is a fully qualified ARN of the KMS Key. If using aws_kms_key, use the exported arn attribute: kms_key_id = aws_kms_key.foo.arn"
  type        = string
  default     = ""
}
variable "s3_object_copy_metadata" {
  description = "Map of keys/values to provision metadata (will be automatically prefixed by x-amz-meta-, note that only lowercase label are currently supported by the AWS Go API)"
  type        = map(string)
  default     = {}
}
variable "s3_object_copy_metadata_directive" {
  description = "Specifies whether the metadata is copied from the source object or replaced with metadata provided in the request. Valid values are COPY and REPLACE"
  type        = string
  default     = ""
}
variable "s3_object_copy_object_lock_legal_hold_status" {
  description = "The legal hold status that you want to apply to the specified object. Valid values are ON and OFF"
  type        = string
  default     = ""
}
variable "s3_object_copy_object_lock_mode" {
  description = "Object lock retention mode that you want to apply to this object. Valid values are GOVERNANCE and COMPLIANCE"
  type        = string
  default     = ""
}
variable "s3_object_copy_object_lock_retain_until_date" {
  description = "Date and time, in RFC3339 format, when this object's object lock will expire"
  type        = string
  default     = ""
}
variable "s3_object_copy_request_payer" {
  description = "Confirms that the requester knows that they will be charged for the request. Bucket owners need not specify this parameter in their requests "
  type        = string
  default     = ""
}
variable "s3_object_copy_server_side_encryption" {
  description = "Specifies server-side encryption of the object in S3. Valid values are AES256 and aws:kms"
  type        = string
  default     = ""
}
variable "s3_object_copy_source" {
  description = "Specifies the source object for the copy operation. You specify the value in one of two formats. For objects not accessed through an access point, specify the name of the source bucket and the key of the source object, separated by a slash (/). For example, testbucket/test1.json. For objects accessed through access points, specify the ARN of the object as accessed through the access point, in the format arn:aws:s3:<Region>:<account-id>:accesspoint/<access-point-name>/object/<key>. For example, arn:aws:s3:us-west-2:9999912999:accesspoint/my-access-point/object/testbucket/test1.json"
  type        = string
}
variable "s3_object_copy_source_customer_algorithm" {
  description = "Specifies the algorithm to use when decrypting the source object (for example, AES256)"
  type        = string
  default     = ""
}
variable "s3_object_copy_source_customer_key" {
  description = "Specifies the customer-provided encryption key for Amazon S3 to use to decrypt the source object. The encryption key provided in this header must be one that was used when the source object was created"
  type        = string
  default     = ""
}
variable "s3_object_copy_source_customer_key_md5" {
  description = " Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure that the encryption key was transmitted without error"
  type        = string
  default     = ""
}
variable "s3_object_copy_storage_class" {
  description = "Specifies the desired storage class for the object. Defaults to STANDARD"
  type        = string
  default     = ""
}
variable "s3_object_copy_tagging_directive" {
  description = "Specifies whether the object tag-set are copied from the source object or replaced with tag-set provided in the request. Valid values are COPY and REPLACE"
  type        = string
  default     = ""
}
variable "s3_object_copy_tags" {
  description = "Map of tags to assign to the object"
  type        = map(string)
  default     = {}
}
variable "s3_object_copy_website_redirect" {
  description = "Specifies a target URL for website redirect"
  type        = string
  default     = ""
}
variable "s3_object_copy_grant" {
  description = "header grants configuration"
  type        = list(object({
    email      = optional(string)
    id         = optional(string) 
    permission = list(string)
    type       = string
    uri        = optional(string) 
  }))
  default     = []
}
