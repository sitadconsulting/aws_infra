output "api_gateway_vpc_link_id" {
  description = "Identifier of the VpcLink"
  value       = element(concat(aws_api_gateway_vpc_link.api_gateway_vpc_link.*.id, [""]), 0)
}

