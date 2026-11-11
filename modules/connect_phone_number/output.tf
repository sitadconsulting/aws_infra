output "connect_phone_number_arn" {
  description = "The ARN of the phone number"
  value       = element(concat(aws_connect_phone_number.connect_phone_number.*.arn, [""]), 0)
}
output "connect_phone_number_phone_number" {
  description = "The phone number. Phone numbers are formatted [+] [country code] [subscriber number including area code]"
  value       = element(concat(aws_connect_phone_number.connect_phone_number.*.phone_number, [""]), 0)
}
output "connect_phone_number_id" {
  description = "The identifier of the phone number"
  value       = element(concat(aws_connect_phone_number.connect_phone_number.*.id, [""]), 0)
}
output "connect_phone_number_status" {
  description = "A block that specifies status of the phone number"
  value       = element(concat(aws_connect_phone_number.connect_phone_number.*.status, [""]), 0)
}
