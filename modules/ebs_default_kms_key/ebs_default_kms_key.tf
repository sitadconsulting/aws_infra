resource "aws_ebs_default_kms_key" "ebs_default_kms_key" {
  key_arn = var.ebs_default_kms_key_key_arn
}
