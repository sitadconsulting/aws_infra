resource "aws_iot_certificate" "iot_certificate" {
  active          = var.iot_certificate_active
  csr             = var.iot_certificate_csr
  certificate_pem = var.iot_certificate_certificate_pem
  ca_pem          = var.iot_certificate_ca_pem 
}
