output "eip_domain_name_ptr_record" {
  description = "The DNS pointer (PTR) record for the IP address"
  value       = element(concat(aws_eip_domain_name.eip_domain_name.*.ptr_record, [""]), 0)
}
