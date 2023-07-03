variable "sqs_queue_policy_queue_url" {
  description = "The URL of the SQS Queue to which to attach the policy"
  type        = string
}
variable "sqs_queue_policy_policy" {
  description = "The JSON policy for the SQS queue"
  type        = string
}
