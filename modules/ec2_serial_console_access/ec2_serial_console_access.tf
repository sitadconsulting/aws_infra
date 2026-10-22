resource "aws_ec2_serial_console_access" "ec2_serial_console_access" {
  enabled = var.ec2_serial_console_access_enabled
}
