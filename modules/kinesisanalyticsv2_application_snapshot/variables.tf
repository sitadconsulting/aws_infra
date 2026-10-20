variable "kinesisanalyticsv2_application_snapshot_application_name" {
  description = "(Required) Name of an existing Kinesis Analytics v2 Application. Note that the application must be running for a snapshot to be created"
  type        = string
}
variable "kinesisanalyticsv2_application_snapshot_snapshot_name" {
  description = "(Required) Name of the application snapshot"
  type        = string
}
