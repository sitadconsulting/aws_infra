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
variable "lambda_function_tags" {
  description = "A map of additional lambda function tags"
  type        = map(string)
  default     = {}
}
variable "vpc_cidr" {
  description = "VPC cidr block"
  type        = string
  default     = ""
}
variable "kinesis_stream_tags" {
  description = "Additional tags for the Kinesis stream"
  type        = map(string)
  default     = {}
}
variable "kinesis_stream_name" {
  description = "Name of Kinesis stream"
  type        = string
  default     = ""
}
variable "athena_query_result_s3_bucket_name" {
  description = "Name of s3 bucket to store athena query result"
  type        = string
  default     = ""
}
variable "s3_assets_bucket_name" {
  description = "Name of s3 bucket to store code assets"
  type        = string
  default     = ""
}
variable "athena_workgroup_name" {
  description = "Name of the Athena workgroup"
  type        = string
  default     = ""
}
variable "glue_service_iam_role_name" {
  description = "Glue service iam role name"
  type        = string
  default     = ""
}
variable "glue_developer_iam_group_name" {
  description = "Glue developer iam group name"
  type        = string
  default     = ""
}
variable "glue_service_notebook_iam_role_name" {
  description = "Glue service notebook iam role name"
  type        = string
  default     = ""
}
variable "sagemaker_notebook_iam_role_name" {
  description = "Sagemaker notebook iam role name"
  type        = string
  default     = ""
}
variable "lambda_service_iam_role_name" {
  description = "Lambda service iam role name"
  type        = string
  default     = ""
}
variable "lambda_service_iam_policy_name" {
  description = "Lambda service iam policy name"
  type        = string
  default     = ""
}
variable "gsw_lambda_function_name" {
  description = "GSW Lambda function name"
  type        = string
  default     = ""
}
