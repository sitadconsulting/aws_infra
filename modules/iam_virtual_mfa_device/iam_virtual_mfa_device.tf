resource "aws_iam_virtual_mfa_device" "iam_virtual_mfa_device" {
  path                    = var.iam_virtual_mfa_device_path
  tags                    = var.iam_virtual_mfa_device_tags
  virtual_mfa_device_name = var.iam_virtual_mfa_device_virtual_mfa_device_name

}
