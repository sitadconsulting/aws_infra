resource "aws_sqs_queue" "sqs_queue" {
  content_based_deduplication       = var.sqs_queue_content_based_deduplication
  deduplication_scope               = var.sqs_queue_deduplication_scope
  delay_seconds                     = var.sqs_queue_delay_seconds
  fifo_queue                        = var.sqs_queue_fifo_queue
  fifo_throughput_limit             = var.sqs_queue_fifo_throughput_limit
  kms_data_key_reuse_period_seconds = var.sqs_queue_kms_data_key_reuse_period_seconds
  kms_master_key_id                 = var.sqs_queue_kms_master_key_id
  max_message_size                  = var.sqs_queue_max_message_size
  message_retention_seconds         = var.sqs_queue_message_retention_seconds
  name                              = var.sqs_queue_name
  name_prefix                       = var.sqs_queue_name_prefix
  policy                            = var.sqs_queue_policy
  receive_wait_time_seconds         = var.sqs_queue_receive_wait_time_seconds
  redrive_allow_policy              = var.sqs_queue_redrive_allow_policy
  redrive_policy                    = var.sqs_queue_redrive_policy
  sqs_managed_sse_enabled           = var.sqs_queue_sqs_managed_sse_enabled
  tags                              = var.sqs_queue_tags
  visibility_timeout_seconds        = var.sqs_queue_visibility_timeout_seconds
}
