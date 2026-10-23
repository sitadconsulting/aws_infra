resource "aws_volume_attachment" "volume_attachment" {
  device_name                    = var.volume_attachment_device_name
  force_detach                   = var.volume_attachment_force_detach
  instance_id                    = var.volume_attachment_instance_id
  skip_destroy                   = var.volume_attachment_skip_destroy
  stop_instance_before_detaching = var.volume_attachment_stop_instance_before_detaching
  volume_id                      = var.volume_attachment_volume_id
}
