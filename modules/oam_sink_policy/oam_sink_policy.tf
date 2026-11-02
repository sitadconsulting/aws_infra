resource "aws_oam_sink_policy" "oam_sink_policy" {
  sink_identifier = var.oam_sink_policy_sink_identifier
  policy          = var.oam_sink_policy_policy
}
