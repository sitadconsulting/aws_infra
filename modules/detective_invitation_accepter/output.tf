output "detective_invitation_accepter_id" {
  description = "Unique identifier (ID) of the Detective invitation accepter"
  value       = element(concat(aws_detective_invitation_accepter.detective_invitation_accepter.*.id, [""]), 0)
}
