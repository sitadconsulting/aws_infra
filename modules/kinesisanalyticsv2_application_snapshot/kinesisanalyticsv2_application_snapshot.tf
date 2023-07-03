resource "aws_kinesisanalyticsv2_application_snapshot" "kinesisanalyticsv2_application_snapshot" {
  application_name = var.kinesisanalyticsv2_application_snapshot_application_name
  snapshot_name    = var.kinesisanalyticsv2_application_snapshot_snapshot_name
}
