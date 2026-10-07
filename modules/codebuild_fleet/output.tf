output "codebuild_fleet_arn" {
  description = "ARN of the Fleet"
  value       = element(concat(aws_codebuild_fleet.codebuild_fleet.*.arn, [""]), 0)
}
output "codebuild_fleet_created" {
  description = "Creation time of the fleet"
  value       = element(concat(aws_codebuild_fleet.codebuild_fleet.*.created, [""]), 0)
}
output "codebuild_fleet_id" {
  description = "ARN of the Fleet"
  value       = element(concat(aws_codebuild_fleet.codebuild_fleet.*.id, [""]), 0)
}
output "codebuild_fleet_ast_modified" {
  description = "Last modification time of the fleet"
  value       = element(concat(aws_codebuild_fleet.codebuild_fleet.*.ast_modified, [""]), 0)
}
output "codebuild_fleet_status" {
  description = "Nested attribute containing information about the current status of the fleet"
  value       = element(concat(aws_codebuild_fleet.codebuild_fleet.*.status, [""]), 0)
}
