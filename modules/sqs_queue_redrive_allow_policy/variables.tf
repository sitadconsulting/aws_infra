variable "sqs_queue_redrive_allow_policy_queue_url" {
  description = "The URL of the SQS Queue to which to attach the policy"
  type        = string
}
variable "sqs_queue_redrive_allow_policy_redrive_allow_policy" {
  description = "The JSON redrive allow policy for the SQS queue"
  type        = string
}
