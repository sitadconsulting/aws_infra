variable "s3_object_acl" {
  description = "Canned ACL to apply. Valid values are private, public-read, public-read-write, aws-exec-read, authenticated-read, bucket-owner-read, and bucket-owner-full-control. Defaults to private"
  type        = string
  default     = "private"
}
variable "s3_object_bucket" {
  description = "Name of the bucket to put the file in. Alternatively, an S3 access point ARN can be specified"
  type        = string
}
variable "s3_object_bucket_key_enabled" {
  description = "Whether or not to use Amazon S3 Bucket Keys for SSE-KMS"
  type        = bool
  default     = false
}
variable "s3_object_cache_control" {
  description = "Caching behavior along the request/reply chain"
  type        = string
  default     = ""
}
variable "s3_object_content" {
  description = "Literal string value to use as the object content, which will be uploaded as UTF-8-encoded text"
  type        = string
  default     = null
}
variable "s3_object_content_base64" {
  description = "Base64-encoded data that will be decoded and uploaded as raw bytes for the object content"
  type        = string
  default     = null
}
variable "s3_object_content_disposition" {
  description = "Presentational information for the object"
  type        = string
  default     = ""
}
variable "s3_object_content_encoding" {
  description = "Content encodings that have been applied to the object and thus what decoding mechanisms must be applied to obtain the media-type referenced by the Content-Type header field"
  type        = string
  default     = ""
}
variable "s3_object_content_language" {
  description = "Language the content is in e.g., en-US or en-GB"
  type        = string
  default     = ""
}
variable "s3_object_content_type" {
  description = "Standard MIME type describing the format of the object data, e.g., application/octet-stream. All Valid MIME Types are valid for this input"
  type        = string
  default     = ""
}
variable "s3_object_etag" {
  description = "Triggers updates when the value changes. The only meaningful value is filemd5(\"path/to/file\") (Terraform 0.11.12 or later). This attribute is not compatible with KMS encryption, kms_key_id or server_side_encryption = \"aws:kms\" (see source_hash instead)"
  type        = string
  default     = ""
}
variable "s3_object_force_destroy" {
  description = "Whether to allow the object to be deleted by removing any legal hold on any object version. Default is false. This value should be set to true only if the bucket has S3 object lock enabled"
  type        = bool
  default     = false
}
variable "s3_object_key" {
  description = "Name of the object once it is in the bucket"
  type        = string
}
variable "s3_object_kms_key_id" {
  description = "ARN of the KMS Key to use for object encryption. If the S3 Bucket has server-side encryption enabled, that value will automatically be used. If referencing the aws_kms_key resource, use the arn attribute. If referencing the aws_kms_alias data source or resource, use the target_key_arn attribute. Terraform will only perform drift detection if a configuration value is provided"
  type        = string
  default     = null
}
variable "s3_object_metadata" {
  description = "Map of keys/values to provision metadata (will be automatically prefixed by x-amz-meta-, note that only lowercase label are currently supported by the AWS Go API)"
  type        = map(string)
  default     = {}
}
variable "s3_object_object_lock_legal_hold_status" {
  description = "Legal hold status that you want to apply to the specified object. Valid values are ON and OFF"
  type        = string
  default     = ""
}
variable "s3_object_object_lock_mode" {
  description = "Object lock retention mode that you want to apply to this object. Valid values are GOVERNANCE and COMPLIANCE"
  type        = string
  default     = ""
}
variable "s3_object_object_lock_retain_until_date" {
  description = "Date and time, in RFC3339 format, when this object's object lock will expire"
  type        = number
  default     = null
}
variable "s3_object_server_side_encryption" {
  description = "Server-side encryption of the object in S3. Valid values are \"AES256\" and \"aws:kms\""
  type        = string
  default     = ""
}
variable "s3_object_source" {
  description = "Path to a file that will be read and uploaded as raw bytes for the object content - conflicts with content and content_base64"
  type        = string
  default     = ""
}
variable "s3_object_source_hash" {
  description = "Triggers updates like etag but useful to address etag encryption limitations. Set using filemd5("path/to/source") (Terraform 0.11.12 or later)"
  type        = string
  default     = ""
}
variable "s3_object_storage_class" {
  description = "Storage Class for the object. Defaults to \"STANDARD\""
  type        = string
  default     = ""
}
variable "s3_object_tags" {
  description = "Map of tags to assign to the object "
  type        = map(string)
  default     = {}
}
variable "s3_object_website_redirect" {
  description = "Target URL for website redirect"
  type        = string
  default     = ""
}
