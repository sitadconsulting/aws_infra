output "ami_launch_permission_id" {
  description = "Launch permission ID"
  value       = element(concat(aws_ami_launch_permission.ami_launch_permission.*.id, [""]), 0)
}
