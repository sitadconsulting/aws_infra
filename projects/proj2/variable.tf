variable "aws_region" {
   description = "AWS region name"
   type        = string
   default     = "us-east-1"
}
variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = "sitadinfra"
}
variable "environment" {
  description = "The name of the environment"
  type        = string
  default     = "DEV"
}
variable "vpc_tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default     = {}
}
variable "dhcp_options_tags" {
  description = "Additional tags for the DHCP option set (requires enable_dhcp_options set to true)"
  type        = map(string)
  default     = {}
}
variable "internet_gateway_tags" {
  description = "Additional tags for the internet gateway"
  type        = map(string)
  default     = {}
}
variable "public_az_1a" {
  description = "Availability Zone in which to create this public subnet"
  type        = string
  default     = ""
}
variable "public_az_1b" {
  description = "Availability Zone in which to create this public subnet"
  type        = string
  default     = ""
}
variable "public_az_1c" {
  description = "Availability Zone in which to create this public subnet"
  type        = string
  default     = ""
}
variable "private_az_1a" {
  description = "Availability Zone in which to create this public subnet"
  type        = string
  default     = ""
}
variable "private_az_1b" {
  description = "Availability Zone in which to create this public subnet"
  type        = string
  default     = ""
}
variable "private_az_1c" {
  description = "Availability Zone in which to create this public subnet"
  type        = string
  default     = ""
}
variable "public_map_public_ip_on_launch" {
  description = "Whether to auto-assign public IP on launch"
  type        = bool
  default     = false
}
variable "private_map_public_ip_on_launch" {
  description = "Whether to auto-assign public IP on launch"
  type        = bool
  default     = false
}
variable "public_subnet_suffix" {
  description = "Suffix to append to public subnets name"
  type        = string
  default     = "public-subnet"
}
variable "private_subnet_suffix" {
  description = "Suffix to append to private subnets name"
  type        = string
  default     = "private-subnet"
}
variable "public_route_table_suffix" {
  description = "Suffix to append to public route table name"
  type        = string
  default     = "public-route-table"
}
variable "private_route_table_suffix" {
  description = "Suffix to append to private route table name"
  type        = string
  default     = "private-route-table"
}
variable "public_subnet_tags" {
  description = "Additional tags for the public subnets"
  type        = map(string)
  default     = {} 
}
variable "private_subnet_tags" {
  description = "Additional tags for the private subnets"
  type        = map(string)
  default     = {} 
}
variable "eip_tags" {
  description = "Additional tags for the EIP"
  type        = map(string)
  default     = {}
}
variable "nat_gateway_tags" {
  description = "Additional tags for the Nat Gateway"
  type        = map(string)
  default     = {}
}
variable "iam_policy_tags" {
  description = "A map of additional iam_policy tags"
  type        = map(string)
  default     = {}
}
variable "iam_role_tags" {
  description = "A map of additional iam_role tags"
  type        = map(string)
  default     = {}
}
variable "s3_bucket_tags" {
  description = "A map of additional s3 bucket tags"
  type        = map(string)
  default     = {}
}
variable "vpc_cidr" {
  description = "VPC cidr block"
  type        = string
  default     = ""
}
variable "public_subnet_1a_cidr" {
  description = "Public subnet 1a cidr block"
  type        = string
  default     = ""
}
variable "public_subnet_1b_cidr" {
  description = "Public subnet 1b cidr block"
  type        = string
  default     = ""
}
variable "public_subnet_1c_cidr" {
  description = "Public subnet 1c cidr block"
  type        = string
  default     = ""
}
variable "private_subnet_1a_cidr" {
  description = "Private subnet 1a cidr block"
  type        = string
  default     = ""
}
variable "private_subnet_1b_cidr" {
  description = "private subnet 1b cidr block"
  type        = string
  default     = ""
}
variable "private_subnet_1c_cidr" {
  description = "private subnet 1c cidr block"
  type        = string
  default     = ""
}
variable "remote_access_to_kafka_client_instance_port_22" {
  description = "list of CIDR's allowed remote access to Kafka client instance on port 22"
  type        = list(string)
  default     = []
}
variable "remote_access_to_kafka_client_instance_port_8081" {
  description = "list of CIDR's allowed remote access to Kafka client instance on port 8081"
  type        = list(string)
  default     = []
}
variable "msk_cluster_name" {
  description = "Cluster name"
  type        = string
  default     = ""
}
variable "ec2_iam_role" {
  description = "EC2 service trust role"
  type        = string
  default     = ""
}
variable "kda_iam_role" {
  description = "Kinesis Data Analytics trust role"
  type        = string
  default     = ""
}
variable "kafka_connect_iam_role" {
  description = "Kafka connect trust role"
  type        = string
  default     = ""
}
variable "kafka_authorization_iam_policy_name" {
  description = "Kafka iam authorization policy"
  type        = string
  default     = ""
}
variable "kafka_connect_iam_policy_name" {
  description = "Kafka connect iam policy"
  type        = string
  default     = ""
}
variable "kafka_client_instance_public_key" {
  description = "Kafka client instance public key"
  type        = string
  default     = ""
}
variable "s3_streaming_artifacts_bucket_name" {
  description = "Name of s3 bucket use to store code artifacts"
  type        = string
  default     = ""
}
variable "s3_kafka_connect_target_bucket_name" {
  description = "Name of s3 bucket use as destination for Kafka connect to store data"
  type        = string
  default     = ""
}
variable "ssl_keystore_password" {
  description = "SSL keystore password"
  type        = string
  default     = ""
}
variable "ssl_key_password" {
  description = "SSL key password"
  type        = string
  default     = ""
}
variable "trust_store_password" {
  description = "SSL truststore password"
  type        = string
  default     = ""
}
variable "opensearch_master_user_password" {
  description = "Opensearch master user password"
  type        = string
  default     = ""
}
