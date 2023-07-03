variable "sqs_queue_redrive_policy_queue_url" {
  description = "The URL of the SQS Queue to which to attach the policy"
  type        = string
}
variable "sqs_queue_redrive_policy_redrive_policy" {
  description = "The JSON redrive policy for the SQS queue. Accepts two key/val pairs: deadLetterTargetArn and maxReceiveCount"
  type        = string
}
