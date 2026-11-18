output "emr_cluster_applications" {
  description = "Applications installed on this cluster"
  value       = element(concat(aws_emr_cluster.emr_cluster.*.applications, [""]), 0)
}
output "emr_cluster_arn" {
  description = "ARN of the cluster" 
  value       = element(concat(aws_emr_cluster.emr_cluster.*.arn, [""]), 0)
}
output "emr_cluster_bootstrap_action" {
  description = "List of bootstrap actions that will be run before Hadoop is started on the cluster nodes"
  value       = element(concat(aws_emr_cluster.emr_cluster.*.bootstrap_action, [""]), 0)
}
output "emr_cluster_configurations" {
  description = " List of Configurations supplied to the EMR cluster"
  value       = element(concat(aws_emr_cluster.emr_cluster.*.configurations, [""]), 0)
}
output "emr_cluster_core_instance_group_id" {
  description = "Core node type Instance Group ID, if using Instance Group for this node type"
  value       = element(concat(aws_emr_cluster.emr_cluster.core_instance_group.*.id, [""]), 0)
}
output "emr_cluster_ec2_attributes" {
  description = "Provides information about the EC2 instances in a cluster grouped by category: key name, subnet ID, IAM instance profile, and so on"
  value       = element(concat(aws_emr_cluster.emr_cluster.*.ec2_attributes, [""]), 0)
}
output "emr_cluster_id" {
  description = "ID of the cluster"
  value       = element(concat(aws_emr_cluster.emr_cluster.*.id, [""]), 0)
}
output "emr_cluster_log_uri" {
  description = "Path to the Amazon S3 location where logs for this cluster are stored"
  value       = element(concat(aws_emr_cluster.emr_cluster.*.log_uri, [""]), 0)
}
output "emr_cluster_master_instance_group_id" {
  description = "Master node type Instance Group ID, if using Instance Group for this node type"
  value       = element(concat(aws_emr_cluster.emr_cluster.master_instance_group.*.id, [""]), 0)
}
output "emr_cluster_master_public_dns" {
  description = "The DNS name of the master node. If the cluster is on a private subnet, this is the private DNS name. On a public subnet, this is the public DNS name"
  value       = element(concat(aws_emr_cluster.emr_cluster.*.master_public_dns, [""]), 0)
}
output "emr_cluster_name" {
  description = "Name of the cluster"
  value       = element(concat(aws_emr_cluster.emr_cluster.*.name, [""]), 0)
}
output "emr_cluster_release_label" {
  description = "Release label for the Amazon EMR release"
  value       = element(concat(aws_emr_cluster.emr_cluster.*.release_label, [""]), 0)
}
output "emr_cluster_service_role" {
  description = "IAM role that will be assumed by the Amazon EMR service to access AWS resources on your behalf"
  value       = element(concat(aws_emr_cluster.emr_cluster.*.service_role, [""]), 0)
}
