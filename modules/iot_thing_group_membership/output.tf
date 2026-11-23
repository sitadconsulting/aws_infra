output "iot_thing_group_membership_id" {
  description = "The membership ID"
  value       = element(concat(aws_iot_thing_group_membership.iot_thing_group_membership.*.id, [""]), 0)
}
