variable "quicksight_vpc_connection_aws_account_id" {
  description = "AWS account ID"
  type        = string
  default     = ""
}
variable "quicksight_vpc_connection_vpc_connection_id" {
  description = "The ID of the VPC connection"
  type        = string
}
variable "quicksight_vpc_connection_name" {
  description = "The display name for the VPC connection"
  type        = string
}
variable "quicksight_vpc_connection_role_arn" {
  description = "The IAM role to associate with the VPC connection"
  type        = string
}
variable "quicksight_vpc_connection_security_group_ids" {
  description = "A list of security group IDs for the VPC connection"
  type        = list(string)
}
variable "quicksight_vpc_connection_subnet_ids" {
  description = "A list of subnet IDs for the VPC connection"
  type        = list(string)
}
variable "quicksight_vpc_connection_dns_resolvers" {
  description = "A list of IP addresses of DNS resolver endpoints for the VPC connection"
  type        = list(string)
  default     = []
}
variable "quicksight_vpc_connection_tags" {
  description = "Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
