output "iam_virtual_mfa_device_id" {
  description = "Serial number associated with the virtual MFA device"
  value       = element(concat(aws_iam_virtual_mfa_device.iam_virtual_mfa_device.*.id, [""]), 0)
}
output "iam_virtual_mfa_device_arn" {
  description = "ARN, which is also the serial number, of the virtual MFA device"
  value       = element(concat(aws_iam_virtual_mfa_device.iam_virtual_mfa_device.*.arn, [""]), 0)
}
output "iam_virtual_mfa_device_base_32_string_seed" {
  description = "Base32 seed defined as specified in RFC3548. The base_32_string_seed is base64-encoded"
  value       = element(concat(aws_iam_virtual_mfa_device.iam_virtual_mfa_device.*.base_32_string_seed, [""]), 0)
}
output "iam_virtual_mfa_device_enable_date" {
  description = "Date and time when the virtual MFA device was enabled"
  value       = element(concat(aws_iam_virtual_mfa_device.iam_virtual_mfa_device.*.enable_date, [""]), 0)
}
output "iam_virtual_mfa_device_qr_code_png" {
  description = "QR code PNG image that encodes otpauth://totp/$virtualMFADeviceName@$AccountName?secret=$Base32String where $virtualMFADeviceName is one of the create call arguments. AccountName is the user name if set (otherwise, the account ID), and Base32String is the seed in base32 format"
  value       = element(concat(aws_iam_virtual_mfa_device.iam_virtual_mfa_device.*.qr_code_png, [""]), 0)
}
output "iam_virtual_mfa_device_serial_number" {
  description = "Serial number associated with the virtual MFA device"
  value       = element(concat(aws_iam_virtual_mfa_device.iam_virtual_mfa_device.*.serial_number, [""]), 0)
}
output "iam_virtual_mfa_device_user_name" {
  description = "Name of the IAM user associated with this virtual MFA device"
  value       = element(concat(aws_iam_virtual_mfa_device.iam_virtual_mfa_device.*.user_name, [""]), 0)
}
