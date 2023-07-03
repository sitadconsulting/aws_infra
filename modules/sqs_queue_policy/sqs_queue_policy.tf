resource "aws_sqs_queue_policy" "sqs_queue_policy" {

  queue_url = var.sqs_queue_policy_queue_url
  policy    = var.sqs_queue_policy_policy
}
