output "ec2_availability_zone_group_id" {
  description = "Name of the Availability Zone Group"
  value       = element(concat(aws_ec2_availability_zone_group.ec2_availability_zone_group.*.id, [""]), 0)
}
