resource "aws_sqs_queue_redrive_policy" "sqs_queue_redrive_policy" {
  queue_url      = var.sqs_queue_redrive_policy_queue_url
  redrive_policy = var.sqs_queue_redrive_policy_redrive_policy
}
