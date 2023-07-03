output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = concat(aws_internet_gateway.internet_gateway.*.id, [""])[0]
}
output "internet_gateway_arn" {
  description = "ARN of the Internet Gateway"
  value       = concat(aws_internet_gateway.internet_gateway.*.arn, [""])[0]
}
output "internet_gateway_owner_id" {
  description = "The ID of the AWS account that owns the internet gateway"
  value       = concat(aws_internet_gateway.internet_gateway.*.owner_id, [""])[0]
}

