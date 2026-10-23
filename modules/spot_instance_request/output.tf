output "spot_instance_request_id" {
  description = "The Spot Instance Request ID"
  value       = element(concat(aws_spot_instance_request.spot_instance_request.*.id, [""]), 0)
}
