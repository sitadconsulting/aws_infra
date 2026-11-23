resource "aws_iot_thing_principal_attachment" "iot_thing_principal_attachment" {
  principal            = var.iot_thing_principal_attachment_principal
  thing                = var.iot_thing_principal_attachment_thing
  thing_principal_type = var.iot_thing_principal_attachment_thing_principal_type
}
