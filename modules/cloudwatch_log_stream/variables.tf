variable "cloudwatch_log_stream_log_group_name" {
  description = "The name of the log group under which the log stream is to be created"
  type        = string
}
variable "cloudwatch_log_stream_name" {
  description = "he name of the log stream. Must not be longer than 512 characters and must not contain :"
  type        = string
}
