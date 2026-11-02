resource "aws_oam_sink" "oam_sink" {
  name = var.oam_sink_name
  tags = var.oam_sink_tags
}
