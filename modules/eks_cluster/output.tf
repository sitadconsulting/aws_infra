output "eks_cluster_id" {
  description = "cluster id"
  value       = element(concat(aws_eks_cluster.eks_cluster.*.id, [""]), 0)
}
output "eks_cluster_name" {
  description = "cluster name"
  value       = element(concat(aws_eks_cluster.eks_cluster.*.name, [""]), 0)
}
output "eks_cluster_arn" {
  description = "cluster arn"
  value       = concat(aws_eks_cluster.eks_cluster.*.arn, [""])
}
output "eks_cluster_certificate_authority" {
  description = "cluster certificate authority data"
  value       = concat(aws_eks_cluster.eks_cluster.*.certificate_authority, [""])
}
output "eks_cluster_endpoint" {
  description = "cluster endpoint"
  value       = concat(aws_eks_cluster.eks_cluster.*.endpoint, [""])
}
output "eks_cluster_status" {
  description = "cluster status"
  value       = element(concat(aws_eks_cluster.eks_cluster.*.status, [""]), 0)
}
output "eks_cluster_platform_version" {
  description = "cluster platform version"
  value       = element(concat(aws_eks_cluster.eks_cluster.*.platform_version, [""]), 0)
}
output "eks_cluster_identity" {
  description = "cluster identity provider information"
  value       = concat(aws_eks_cluster.eks_cluster.*.identity, [""])
}
output "eks_cluster_vpc_config" {
  description = "cluster VPC configuration information"
  value       = concat(aws_eks_cluster.eks_cluster.*.vpc_config, [""])
}
output "eks_cluster_security_group_id" {
  description = "cluster security group id"
  value       = element(concat([ for v in aws_eks_cluster.eks_cluster.vpc_config: v.cluster_security_group_id ], [""]), 0) 
}
output "eks_cluster_issuer_url" {
  description = "The issuer URL for the OIDC identity provider"
  value       = trimprefix(element(concat([ for v in aws_eks_cluster.eks_cluster.identity.*.oidc[0]: v.issuer ], [""]), 0), "https://")
  #value       = element(concat(aws_eks_cluster.eks_cluster.identity.*.oidc, [""]), 0)
}
