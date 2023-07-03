variable "rds_cluster_role_association_db_cluster_identifier" {
  description = "DB Cluster Identifier to associate with the IAM Role"
  type        = string
}
variable "rds_cluster_role_association_feature_name" {
  description = "Name of the feature for association. This can be found in the AWS documentation relevant to the integration or a full list is available in the SupportedFeatureNames list returned by AWS CLI rds describe-db-engine-versions"
  type        = string
}
variable "rds_cluster_role_association_role_arn" {
  description = "ARN of the IAM Role to associate with the DB Cluster"
  type        = string
}
