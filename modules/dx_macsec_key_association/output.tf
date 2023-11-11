output "dx_macsec_key_association_id" {
  description = "ID of the MAC Security (MACSec) secret key resource"
  value       = element(concat(aws_dx_macsec_key_association.dx_macsec_key_association.*.id, [""]), 0)
}
output "dx_macsec_key_association_start_on" {
  description = "The date in UTC format that the MAC Security (MACsec) secret key takes effect"
  value       = element(concat(aws_dx_macsec_key_association.dx_macsec_key_association.*.start_on, [""]), 0)
}
output "dx_macsec_key_association_state" {
  description = "The state of the MAC Security (MACsec) secret key. The possible values are: associating, associated, disassociating, disassociated. See MacSecKey for descriptions of each state"
  value       = element(concat(aws_dx_macsec_key_association.dx_macsec_key_association.*.state, [""]), 0)
}
