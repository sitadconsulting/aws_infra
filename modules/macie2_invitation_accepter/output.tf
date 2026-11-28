output "macie2_invitation_accepter_id" {
  description = "Unique identifier (ID) of the Macie invitation accepter"
  value       = element(concat(aws_macie2_invitation_accepter.macie2_invitation_accepter.*.id, [""]), 0)
}
output "macie2_invitation_accepter_invitation_id" {
  description = "Unique identifier for the invitation"
  value       = element(concat(aws_macie2_invitation_accepter.macie2_invitation_accepter.*.invitation_id, [""]), 0)
}
