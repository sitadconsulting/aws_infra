resource "aws_cloudwatch_log_anomaly_detector" "cloudwatch_log_anomaly_detector" {
  log_group_arn_list      = var.cloudwatch_log_anomaly_detector_log_group_arn_list
  anomaly_visibility_time = var.cloudwatch_log_anomaly_detector_anomaly_visibility_time
  detector_name           = var.cloudwatch_log_anomaly_detector_detector_name
  evaluation_frequency    = var.cloudwatch_log_anomaly_detector_evaluation_frequency
  filter_pattern          = var.cloudwatch_log_anomaly_detector_filter_pattern
  kms_key_id              = var.cloudwatch_log_anomaly_detector_kms_key_id
}
