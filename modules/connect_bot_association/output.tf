output "connect_bot_association_id" {
  description = "The Amazon Connect instance ID, Lex (V1) bot name, and Lex (V1) bot region separated by colons (:)"
  value       = element(concat(aws_connect_bot_association.connect_bot_association.*.id, [""]), 0)
}
