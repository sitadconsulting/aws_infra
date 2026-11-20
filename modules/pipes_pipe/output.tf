output "pipes_pipe_arn" {
  description = "ARN of this pipe"
  value       = element(concat(aws_pipes_pipe.pipes_pipe.*.arn, [""]), 0)
}
output "pipes_pipe_id" {
  description = "Name of pipe"
  value       = element(concat(aws_pipes_pipe.pipes_pipe.*.id, [""]), 0)
}
