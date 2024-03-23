output "eks_node_group_arn" {
  description = "Node Group ARN"
  value       = element(concat(aws_eks_node_group.eks_node_group.*.arn, [""]), 0)
}
output "eks_node_group_id" {
  description = "EKS Cluster name and EKS Node Group name separated by a colon (:)"
  value       = element(concat(aws_eks_node_group.eks_node_group.*.id, [""]), 0)
}
output "eks_node_group_resources" {
  description = "List of objects containing information about underlying resources"
  value       = element(concat(aws_eks_node_group.eks_node_group.*.resources, [""]), 0)
}
output "eks_node_group_status" {
  description = "EKS Node Group Status"
  value       = element(concat(aws_eks_node_group.eks_node_group.*.status, [""]), 0)
}
