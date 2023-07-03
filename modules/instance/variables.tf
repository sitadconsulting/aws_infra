variable "instance_ami" {
  description = "AMI to use for the instance. Required unless launch_template is specified and the Launch Template specifes an AMI. If an AMI is specified in the Launch Template, setting ami will override the AMI specified in the Launch Template"
  type        = string
  default     = ""
}
variable "instance_associate_public_ip_address" {
  description = "Whether to associate a public IP address with an instance in a VPC"
  type        = bool
  default     = false
}
variable "instance_availability_zone" {
  description = "AZ to start the instance in"
  type        = string
  default     = ""
}
variable "instance_cpu_core_count" {
  description = "Sets the number of CPU cores for an instance. This option is only supported on creation of instance type that support CPU Options CPU Cores and Threads Per CPU Core Per Instance Type - specifying this option for unsupported instance types will return an error from the EC2 API"
  type        = number
  default     = null
}
variable "instance_cpu_threads_per_core" {
  description = "If set to 1, hyperthreading is disabled on the launched instance. Defaults to 2 if not set"
  type        = number
  default     = null
}
variable "instance_disable_api_stop" {
  description = "If true, enables EC2 Instance Stop Protection"
  type        = bool
  default     = false
}
variable "instance_disable_api_termination" {
  description = "If true, enables EC2 Instance Termination Protection"
  type        = bool
  default     = false
}
variable "instance_ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized. Note that if this is not set on an instance type that is optimized by default then this will show as disabled but if the instance type is optimized by default then there is no need to set this and there is no effect to disabling it"
  type        = bool
  default     = false
}
variable "instance_get_password_data" {
  description = "If true, wait for password data to become available and retrieve it. Useful for getting the administrator password for instances running Microsoft Windows. The password data is exported to the password_data attribute"
  type        = bool
  default     = false
}
variable "instance_hibernation" {
  description = "If true, the launched EC2 instance will support hibernation"
  type        = bool
  default     = false
}
variable "instance_host_id" {
  description = "ID of a dedicated host that the instance will be assigned to. Use when an instance is to be launched on a specific dedicated host"
  type        = string
  default     = ""
}
variable "instance_host_resource_group_arn" {
  description = "ARN of the host resource group in which to launch the instances. If you specify an ARN, omit the tenancy parameter or set it to host"
  type        = string
  default     = ""
}
variable "instance_iam_instance_profile" {
  description = "IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile. Ensure your credentials have the correct permission to assign the instance profile according to the EC2 documentation, notably iam:PassRole"
  type        = string
  default     = ""
}
variable "instance_instance_initiated_shutdown_behavior" {
  description = "Shutdown behavior for the instance. Amazon defaults this to stop for EBS-backed instances and terminate for instance-store instances. Cannot be set on instance-store instances"
  type        = string
  default     = ""
}
variable "instance_instance_type" {
  description = "Instance type to use for the instance. Required unless launch_template is specified and the Launch Template specifies an instance type. If an instance type is specified in the Launch Template, setting instance_type will override the instance type specified in the Launch Template. Updates to this field will trigger a stop/start of the EC2 instance"
  type        = string
  default     = ""
}
variable "instance_ipv6_address_count" {
  description = "Number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet"
  type        = number
  default     = null
}
variable "instance_ipv6_addresses" {
  description = "Specify one or more IPv6 addresses from the range of the subnet to associate with the primary network interface"
  type        = list(string)
  default     = []
}
variable "instance_key_name" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair resource"
  type        = string
  default     = ""
}
variable "instance_monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  type        = bool
  default     = false
}
variable "instance_placement_group" {
  description = "Placement Group to start the instance in"
  type        =
  default     =
}
variable "instance_placement_partition_number" {
  description = "Number of the partition the instance is in. Valid only if the aws_placement_group resource's strategy argument is set to \"partition\""
  type        = string
  default     = ""
}
variable "instance_private_ip" {
  description = "Private IP address to associate with the instance in a VPC"
  type        = string
  default     = ""
}
variable "instance_secondary_private_ips" {
  description = "List of secondary private IPv4 addresses to assign to the instance's primary network interface (eth0) in a VPC. Can only be assigned to the primary network interface (eth0) attached at instance creation, not a pre-existing network interface i.e., referenced in a network_interface block"
  type        = list(string)
  default     = []
}
variable "instance_security_groups" {
  description = "List of security group names to associate with"
  type        = list(string)
  default     = []
}
variable "instance_source_dest_check" {
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs. Defaults true"
  type        = bool
  default     = true
}
variable "instance_subnet_id" {
  description = "VPC Subnet ID to launch in"
  type        = string
  default     = ""
}
variable "instance_tags" {
  description = "Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "instance_tenancy" {
  description = "Tenancy of the instance (if the instance is running in a VPC). An instance with a tenancy of dedicated runs on single-tenant hardware. The host tenancy is not supported for the import-instance command. Valid values are default, dedicated, and host"
  type        = string
  default     = ""
}
variable "instance_user_data" {
  description = "User data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead. Updates to this field will trigger a stop/start of the EC2 instance by default. If the user_data_replace_on_change is set then updates to this field will trigger a destroy and recreate"
  type        = string
  default     = ""
}
variable "instance_user_data_base64" {
  description = "Can be used instead of user_data to pass base64-encoded binary data directly. Use this instead of user_data whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption. Updates to this field will trigger a stop/start of the EC2 instance by default. If the user_data_replace_on_change is set then updates to this field will trigger a destroy and recreate"
  type        = string
  default     = ""
}
variable "instance_user_data_replace_on_change" {
  description = "When used in combination with user_data or user_data_base64 will trigger a destroy and recreate when set to true. Defaults to false if not set"
  type        = bool
  default     = false
}
variable "instance_volume_tags" {
  description = "Map of tags to assign, at instance-creation time, to root and EBS volumes"
  type        = map(string)
  default     = {}
}
variable "instance_vpc_security_group_ids" {
  description = "List of security group IDs to associate with"
  type        = list(string)
  default     = []
}
variable "instance_capacity_reservation_specification" {
  description = "Describes an instance's Capacity Reservation targeting option"
  type        = list(object({
    capacity_reservation_preference = optional(string)
    capacity_reservation_target = optional(list(object({
      capacity_reservation_id                 = optional(string)
      capacity_reservation_resource_group_arn = optional(string)
    })))
  }))
  default     = []
}
variable "instance_cpu_options" {
  description = "The CPU options for the instance"
  type        = list(object({
    amd_sev_snp      = optional(string)
    core_count       = optional(number)
    threads_per_core = optional(number)
  }))
  default     = []
}
variable "instance_credit_specification" {
  description = "Configuration block for customizing the credit specification of the instance"
  type        = list(object({
    cpu_credits = optional(string)
  }))
  default     = []
}
variable "instance_ebs_block_device" {
  description = "One or more configuration blocks with additional EBS block devices to attach to the instance. Block device configurations only apply on resource creation"
  type        = list(object({
    delete_on_termination = optional(bool)
    device_name           = string
    encrypted             = optional(bool)
    iops                  = optional(number)
    kms_key_id            = optional(string)
    snapshot_id           = optional(string)
    tags                  = optional(map(string))
    throughput            = optional(number)
    volume_size           = optional(number)
    volume_type           = optional(string)
  }))
  default     = []
}
variable "instance_enclave_options" {
  description = "Enable Nitro Enclaves on launched instances"
  type        = list(object({
    enabled = false
  }))
  default     = []
}
variable "instance_ephemeral_block_device" {
  description = "One or more configuration blocks to customize Ephemeral (also known as \"Instance Store\") volumes on the instance"
  type        = list(object({
    device_name  = string
    no_device    = optional(bool)
    virtual_name = optional(string)
  }))
  default     = []
}
variable "instance_launch_template" {
  description = "Specifies a Launch Template to configure the instance. Parameters configured on this resource will override the corresponding parameters in the Launch Template"
  type        = list(object({
    id      = optional(string)
    name    = optional(string)
    version = optional(string)
  }))
  default     = []
}
variable "instance_maintenance_options" {
  description = "Maintenance and recovery options for the instance"
  type        = list(object({
    auto_recovery = optional(string)
  }))
  default     = []
}
variable "instance_metadata_options" {
  description = "Customize the metadata options of the instance"
  type        = list(object({
    http_endpoint               = optional(string)
    http_put_response_hop_limit = optional(number)
    http_tokens                 = optional(string)
    instance_metadata_tags      = optional(string)
  }))
  default     = []
}
variable "instance_network_interface" {
  description = "Customize network interfaces to be attached at instance boot time"
  type        = list(object({
    delete_on_termination = optional(bool)
    device_index          = number
    network_card_index    = optional(number)
    network_interface_id  = string
  }))
  default     = []
}
variable "instance_private_dns_name_options" {
  description = "Options for the instance hostname. The default values are inherited from the subnet"
  type        = list(object({
    enable_resource_name_dns_aaaa_record = optional(bool)
    enable_resource_name_dns_a_record    = optional(bool)
    hostname_type                        = optional(string)
  }))
  default     = []
}
variable "instance_root_block_device" {
  description = "Configuration block to customize details about the root block device of the instance"
  type        = list(object({
    delete_on_termination = optional(bool)
    encrypted             = optional(bool)
    iops                  = optional(number)
    kms_key_id            = optional(string)
    tags                  = optional(map(string))
    throughput            = optional(number)
    volume_size           = optional(number)
    volume_type           = optional(string)
  }))
  default     = []
}
