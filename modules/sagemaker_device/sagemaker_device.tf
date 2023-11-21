resource "aws_sagemaker_device" "sagemaker_device" {
  device_fleet_name = var.sagemaker_device_device_fleet_name

  dynamic "device" {
    for_each = var.sagemaker_device_device
      content {
        description    = device.value["description"]
        device_name    = device.value["device_name"]
        iot_thing_name = device.value["iot_thing_name"]
      }
  }
}
