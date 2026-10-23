variable "ebs_default_kms_key_key_arn" {
  description = "(Required, ForceNew) ARN of the KMS customer master key (CMK) to use to encrypt the EBS volume"
  type        = string
}
