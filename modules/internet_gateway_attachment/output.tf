output "vpc_internet_gateway_id" {
  description = "The ID of the VPC and Internet Gateway separated by a colon"
  value       = element(concat(aws_internet_gateway_attachment.internet_gateway_attachment.*.id, [""]), 0)
}
