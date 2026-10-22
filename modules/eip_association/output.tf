output "eip_association_id" {
  description = "ID that represents the association of the Elastic IP address with an instance"
  value       = element(concat(aws_eip_association.eip_association.*.id, [""]), 0)
}
