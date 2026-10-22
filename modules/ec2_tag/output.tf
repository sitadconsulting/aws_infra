output "ec2_tag_id" {
  description = "EC2 resource identifier and key, separated by a comma (,)"
  value       = element(concat(aws_ec2_tag.ec2_tag.*.id, [""]), 0)
}
