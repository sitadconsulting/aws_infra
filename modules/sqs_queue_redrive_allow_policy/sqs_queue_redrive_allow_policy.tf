resource "aws_sqs_queue_redrive_allow_policy" "sqs_queue_redrive_allow_policy" {
  queue_url            = var.sqs_queue_redrive_allow_policy_queue_url 
  redrive_allow_policy = var.sqs_queue_redrive_allow_policy_redrive_allow_policy
}
