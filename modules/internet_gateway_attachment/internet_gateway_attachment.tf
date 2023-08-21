resource "aws_internet_gateway_attachment" "internet_gateway_attachment" {
  internet_gateway_id = var.internet_gateway_attachment_internet_gateway_id
  vpc_id              = var.internet_gateway_attachment_vpc_id
}

