output "msk_cluster_arn" {
  description = "ARN of the MSK cluster"
  value       = element(concat(aws_msk_cluster.msk_cluster.*.arn, [""]), 0)
}
output "msk_cluster_bootstrap_brokers" {
  description = "Comma separated list of one or more hostname:port pairs of kafka brokers suitable to bootstrap connectivity to the kafka cluster. Contains a value if encryption_info.0.encryption_in_transit.0.client_broker is set to PLAINTEXT or TLS_PLAINTEXT. The resource sorts values alphabetically. AWS may not always return all endpoints so this value is not guaranteed to be stable across applies"
  value       = element(concat(aws_msk_cluster.msk_cluster.*.bootstrap_brokers, [""]), 0)
}
output "msk_cluster_bootstrap_brokers_public_sasl_iam" {
  description = "One or more DNS names (or IP addresses) and SASL IAM port pairs. For example, b-1-public.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9198,b-2-public.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9198,b-3-public.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9198. This attribute will have a value if encryption_info.0.encryption_in_transit.0.client_broker is set to TLS_PLAINTEXT or TLS and client_authentication.0.sasl.0.iam is set to true and broker_node_group_info.0.connectivity_info.0.public_access.0.type is set to SERVICE_PROVIDED_EIPS and the cluster fulfill all other requirements for public access. The resource sorts the list alphabetically. AWS may not always return all endpoints so the values may not be stable across applies"
  value       = element(concat(aws_msk_cluster.msk_cluster.*.bootstrap_brokers_public_sasl_iam, [""]), 0)
}
output "msk_cluster_bootstrap_brokers_public_sasl_scram" {
  description = "One or more DNS names (or IP addresses) and SASL SCRAM port pairs. For example, b-1-public.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9196,b-2-public.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9196,b-3-public.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9196. This attribute will have a value if encryption_info.0.encryption_in_transit.0.client_broker is set to TLS_PLAINTEXT or TLS and client_authentication.0.sasl.0.scram is set to true and broker_node_group_info.0.connectivity_info.0.public_access.0.type is set to SERVICE_PROVIDED_EIPS and the cluster fulfill all other requirements for public access. The resource sorts the list alphabetically. AWS may not always return all endpoints so the values may not be stable across applies"
  value       = element(concat(aws_msk_cluster.msk_cluster.*.bootstrap_brokers_public_sasl_scram, [""]), 0)
}
output "msk_cluster_bootstrap_brokers_public_tls" {
  description = "One or more DNS names (or IP addresses) and TLS port pairs. For example, b-1-public.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9194,b-2-public.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9194,b-3-public.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9194. This attribute will have a value if encryption_info.0.encryption_in_transit.0.client_broker is set to TLS_PLAINTEXT or TLS and broker_node_group_info.0.connectivity_info.0.public_access.0.type is set to SERVICE_PROVIDED_EIPS and the cluster fulfill all other requirements for public access. The resource sorts the list alphabetically. AWS may not always return all endpoints so the values may not be stable across applies"
  value       = element(concat(aws_msk_cluster.msk_cluster.*.bootstrap_brokers_public_tls, [""]), 0)
}
output "msk_cluster_bootstrap_brokers_sasl_iam" {
  description = "One or more DNS names (or IP addresses) and SASL IAM port pairs. For example, b-1.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9098,b-2.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9098,b-3.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9098. This attribute will have a value if encryption_info.0.encryption_in_transit.0.client_broker is set to TLS_PLAINTEXT or TLS and client_authentication.0.sasl.0.iam is set to true. The resource sorts the list alphabetically. AWS may not always return all endpoints so the values may not be stable across applies"
  value       = element(concat(aws_msk_cluster.msk_cluster.*.bootstrap_brokers_sasl_iam, [""]), 0)
}
output "msk_cluster_bootstrap_brokers_sasl_scram" {
  description = "One or more DNS names (or IP addresses) and SASL SCRAM port pairs. For example, b-1.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9096,b-2.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9096,b-3.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9096. This attribute will have a value if encryption_info.0.encryption_in_transit.0.client_broker is set to TLS_PLAINTEXT or TLS and client_authentication.0.sasl.0.scram is set to true. The resource sorts the list alphabetically. AWS may not always return all endpoints so the values may not be stable across applies"
  value       = element(concat(aws_msk_cluster.msk_cluster.*.bootstrap_brokers_sasl_scram, [""]), 0)
}
output "msk_cluster_bootstrap_brokers_tls" {
  description = "One or more DNS names (or IP addresses) and TLS port pairs. For example, b-1.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9094,b-2.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9094,b-3.exampleClusterName.abcde.c2.kafka.us-east-1.amazonaws.com:9094. This attribute will have a value if encryption_info.0.encryption_in_transit.0.client_broker is set to TLS_PLAINTEXT or TLS. The resource sorts the list alphabetically. AWS may not always return all endpoints so the values may not be stable across applies"
  value       = element(concat(aws_msk_cluster.msk_cluster.*.bootstrap_brokers_tls, [""]), 0)
}
output "msk_cluster_bootstrap_brokers_vpc_connectivity_sasl_iam" {
  description = "A string containing one or more DNS names (or IP addresses) and SASL IAM port pairs for VPC connectivity. AWS may not always return all endpoints so the values may not be stable across applies"
  value       = element(concat(aws_msk_cluster.msk_cluster.*.bootstrap_brokers_vpc_connectivity_sasl_iam, [""]), 0)
}
output "msk_cluster_bootstrap_brokers_vpc_connectivity_sasl_scram" {
  description = "A string containing one or more DNS names (or IP addresses) and SASL SCRAM port pairs for VPC connectivity. AWS may not always return all endpoints so the values may not be stable across applies"
  value       = element(concat(aws_msk_cluster.msk_cluster.*.bootstrap_brokers_vpc_connectivity_sasl_scram, [""]), 0)
}
output "msk_cluster_bootstrap_brokers_vpc_connectivity_tls" {
  description = "A string containing one or more DNS names (or IP addresses) and TLS port pairs for VPC connectivity. AWS may not always return all endpoints so the values may not be stable across applies"
  value       = element(concat(aws_msk_cluster.msk_cluster.*.bootstrap_brokers_vpc_connectivity_tls, [""]), 0)
}
output "msk_cluster_bootstrap_brokers_ipv6" {
  description = "One or more IPv6 DNS names (or IP addresses) and plaintext port pairs. For example, 2001:db8:1234:1a00:*:80,2001:db8:1234:1a02:*:80,2001:db8:1234:1a04:*:80. This attribute will have a value if the cluster is configured with broker_node_group_info.0.connectivity_info.0.network_type set to DUAL and encryption_info.0.encryption_in_transit.0.client_broker is set to PLAINTEXT or TLS_PLAINTEXT. The resource sorts the list alphabetically. AWS may not always return all endpoints so the values may not be stable across applies"
  value       = element(concat(aws_msk_cluster.msk_cluster.*.bootstrap_brokers_ipv6, [""]), 0)
}
output "msk_cluster_bootstrap_brokers_sasl_iam_ipv6" {
  description = "One or more IPv6 DNS names (or IP addresses) and SASL IAM port pairs. This attribute will have a value if the cluster is configured with broker_node_group_info.0.connectivity_info.0.network_type set to DUAL and encryption_info.0.encryption_in_transit.0.client_broker is set to TLS_PLAINTEXT or TLS and client_authentication.0.sasl.0.iam is set to true. The resource sorts the list alphabetically. AWS may not always return all endpoints so the values may not be stable across applies"
  value       = element(concat(aws_msk_cluster.msk_cluster.*.bootstrap_brokers_sasl_iam_ipv6, [""]), 0)
}
output "msk_cluster_bootstrap_brokers_sasl_scram_ipv6" {
  description = "One or more IPv6 DNS names (or IP addresses) and SASL SCRAM port pairs. This attribute will have a value if the cluster is configured with broker_node_group_info.0.connectivity_info.0.network_type set to DUAL and encryption_info.0.encryption_in_transit.0.client_broker is set to TLS_PLAINTEXT or TLS and client_authentication.0.sasl.0.scram is set to true. The resource sorts the list alphabetically. AWS may not always return all endpoints so the values may not be stable across applies"
  value       = element(concat(aws_msk_cluster.msk_cluster.*.bootstrap_brokers_sasl_scram_ipv6, [""]), 0)
}
output "msk_cluster_bootstrap_brokers_tls_ipv6" {
  description = "One or more IPv6 DNS names (or IP addresses) and TLS port pairs. This attribute will have a value if the cluster is configured with broker_node_group_info.0.connectivity_info.0.network_type set to DUAL and encryption_info.0.encryption_in_transit.0.client_broker is set to TLS_PLAINTEXT or TLS. The resource sorts the list alphabetically. AWS may not always return all endpoints so the values may not be stable across applies"
  value       = element(concat(aws_msk_cluster.msk_cluster.*.bootstrap_brokers_tls_ipv6, [""]), 0)
}
output "msk_cluster_cluster_uuid" {
  description = "UUID of the MSK cluster, for use in IAM policies"
  value       = element(concat(aws_msk_cluster.msk_cluster.*.cluster_uuid, [""]), 0)
}
output "msk_cluster_current_version" {
  description = "Current version of the MSK Cluster used for updates, e.g., K13V1IB3VIYZZH"
  value       = element(concat(aws_msk_cluster.msk_cluster.*.current_version, [""]), 0)
}
output "msk_cluster_customer_action_status" {
  description = "Status indicating whether Amazon MSK requires customer action for the cluster. Valid values are NONE, ACTION_RECOMMENDED, and CRITICAL_ACTION_REQUIRED"
  value       = element(concat(aws_msk_cluster.msk_cluster.*.customer_action_status, [""]), 0)
}
output "msk_cluster_encryption_info_encryption_at_rest_kms_key_arn" {
  description = "The ARN of the KMS key used for encryption at rest of the broker data volumes"
  value       = element(concat(aws_msk_cluster.msk_cluster.encryption_info.*.encryption_at_rest_kms_key_arn, [""]), 0)
}
output "msk_cluster_storage_mode" {
  description = "Controls storage mode for supported storage tiers. Valid values are: LOCAL or TIERED"
  value       = element(concat(aws_msk_cluster.msk_cluster.*.storage_mode, [""]), 0)
}
output "msk_cluster_zookeeper_connect_string" {
  description = "A comma separated list of one or more hostname:port pairs to use to connect to the Apache Zookeeper cluster. The returned values are sorted alphabetically. The AWS API may not return all endpoints, so this value is not guaranteed to be stable across applies"
  value       = element(concat(aws_msk_cluster.msk_cluster.*.zookeeper_connect_string, [""]), 0)
}
output "msk_cluster_zookeeper_connect_string_tls" {
  description = "A comma separated list of one or more hostname:port pairs to use to connect to the Apache Zookeeper cluster via TLS. The returned values are sorted alphabetically. The AWS API may not return all endpoints, so this value is not guaranteed to be stable across applies"
  value       = element(concat(aws_msk_cluster.msk_cluster.*.zookeeper_connect_string_tls, [""]), 0)
}
