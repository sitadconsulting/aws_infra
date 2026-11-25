output "lexv2models_bot_id" {
  description = "Unique identifier for a particular bot"
  value       = element(concat(aws_lexv2models_bot.lexv2models_bot.*.id, [""]), 0)
}
