output "dax_cluster_arn" {
  description = "The ARN of the DAX cluster"
  value       = element(concat(aws_dax_cluster.dax_cluster.*.arn, [""]), 0)
}
output "dax_cluster_nodes" {
  description = "List of node objects including id, address, port and availability_zone. Referenceable e.g., as ${aws_dax_cluster.test.nodes.0.address}"
  value       = element(concat(aws_dax_cluster.dax_cluster.*.nodes, [""]), 0)
}
output "dax_cluster_configuration_endpoint" {
  description = "The configuration endpoint for this DAX cluster, consisting of a DNS name and a port number"
  value       = element(concat(aws_dax_cluster.dax_cluster.*.configuration_endpoint, [""]), 0)
}
output "dax_cluster_cluster_address" {
  description = "The DNS name of the DAX cluster without the port appended"
  value       = element(concat(aws_dax_cluster.dax_cluster.*.cluster_address, [""]), 0)
}
output "dax_cluster_port" {
  description = "The port used by the configuration endpoint"
  value       = element(concat(aws_dax_cluster.dax_cluster.*.port, [""]), 0)
}
