variable "s3_bucket_policy_bucket" {
  description = "Name of the bucket for which policy is to be applied"
  type        = string
}
variable "s3_bucket_policy_policy" {
  description = "Text of the policy. Although this is a bucket policy rather than an IAM policy, the aws_iam_policy_document data source may be used, so long as it specifies a principal"
  type        = string
}
