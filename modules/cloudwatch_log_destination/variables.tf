variable "cloudwatch_log_destination_name" {
  description = "A name for the log destination"
  type        = string
}
variable "cloudwatch_log_destination_role_arn" {
  description = "The ARN of an IAM role that grants Amazon CloudWatch Logs permissions to put data into the target"
  type        = string
}
variable "cloudwatch_log_destination_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "cloudwatch_log_destination_target_arn" {
  description = "The ARN of the target Amazon Kinesis stream resource for the destination"
  type        = string
}
