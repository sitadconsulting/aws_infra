variable "aws_region" {
   description = "AWS region name"
   type        = string
   default     = ""
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
variable "public_subnet_tags" {
  description = "Additional tags for the public subnets"
  type        = map(string)
  default     = {
     "kubernetes.io/cluster/sitadinfra-eks_cluster-DEV" = "shared"
     "kubernetes.io/role/elb"                           = "1"
  }
}
variable "private_subnet_tags" {
  description = "Additional tags for the private subnets"
  type        = map(string)
  default     = {
    "kubernetes.io/cluster/sitadinfra-eks_cluster-DEV" = "shared"
    "kubernetes.io/role/internal-elb"                  = "1"
  }
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
variable "eks_cluster_tags" {
  description = "A map of additional cluster tags"
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
variable "node_role" {
  description = "Cluster node role"
  type        = string
  default     = ""
}
variable "caller_user_id" {
  description = "Name of an existing user with administrator account rights used to create the cluster initially"
  type        = string
  default     = ""
}
variable "cluster_admin" {
  description = "Name of the cluster admin user"
  type        = string
  default     = ""
}
variable "vpc_cidr" {
  description = "VPC cidr block"
  type        = string
  default     = ""
}
variable "az_1a_public_cidr" {
  description = "AZ 1a public cidr block"
  type        = string
  default     = ""
}
variable "az_1b_public_cidr" {
  description = "AZ 1b public cidr block"
  type        = string
  default     = ""
}
variable "az_1a_private_cidr" {
  description = "AZ 1a private cidr block"
  type        = string
  default     = ""
}
variable "az_1b_private_cidr" {
  description = "AZ 1b private cidr block"
  type        = string
  default     = ""
}
variable "cluster_name" {
  description = "Cluster name"
  type        = string
  default     = ""
}
variable "public_access_cidrs" {
  description = "The public cidrs from which to connect to the cluster"
  type        = list(string)
  default     = []
}
variable "cluster_iam_role_name" {
  description = "Cluster iam role name"
  type        = string
  default     = ""
}
variable "node_group_public_key" {
  description = "The public for accessing the nodes"
  type        = string
  default     = ""
}
variable "node_group_iam_role" {
  description = "Node group iam role name"
  type        = string
  default     = ""
}
variable "aws_lb_controller_iam_role_name" {
  description = "AWS LB Controller iam role name"
  type        = string
  default     = ""
}
variable "awslbc_iam_policy_name" {
  description = "AWS LB Controller iam role policy name"
  type        = string
  default     = ""
}
variable "ebs_csi_driver_iam_role_name" {
  description = "EBS CSI iam role name"
  type        = string
  default     = ""
}
variable "eks_cluster_admin_user" {
  description = "EKS Cluster Admin user name"
  type        = string
  default     = ""
}
variable "eks_admin_user_policy_name" {
  description = "EKS Cluster Admin user policy name"
  type        = string
  default     = ""
}
variable "nginx_db_secret_iam_policy_name" {
  description = "Nginx DB Secret iam policy name"
  type        = string
  default     = ""
}
variable "nginx_db_secret_iam_role_name" {
  description = "Nginx DB Secret iam role name"
  type        = string
  default     = ""
}
variable "awspca_iam_role_name" {
  description = "AWS Private CA iam role name"
  type        = string
  default     = ""
}
variable "awspca_iam_policy_name" {
  description = "AWS Private CA iam policy name"
  type        = string
  default     = ""
}
variable "awsgatewayapi_iam_role_name" {
  description = "AWS Gateway Api iam role name"
  type        = string
  default     = ""
}
variable "awsgatewayapi_iam_policy_name" {
  description = "AWS Gateway Api iam policy name"
  type        = string
  default     = ""
}
variable "acm_certificate_domain_name" {
  description = "Domain name of the ACM certificate"
  type        = string
  default     = ""
}
