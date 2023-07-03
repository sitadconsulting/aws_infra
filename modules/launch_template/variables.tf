variable "launch_template_default_version" {
  description = "Default Version of the launch template"
  type        = number
  default     = null
}
variable "launch_template_description" {
  description = "Description of the launch template"
  type        = string
  default     = ""
}
variable "launch_template_disable_api_stop" {
  description = "If true, enables EC2 Instance Stop Protection"
  type        = bool
  default     = false
}
variable "launch_template_disable_api_termination" {
  description = "If true, enables EC2 Instance Termination Protection"
  type        = bool
  default     = false
}
variable "launch_template_ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  type        = bool
  default     = false
}
variable "launch_template_image_id" {
  description = "The AMI from which to launch the instance"
  type        = string
  default     = ""
}
variable "launch_template_instance_initiated_shutdown_behavior" {
  description = "Shutdown behavior for the instance. Can be stop or terminate. (Default: stop)"
  type        = string
  default     = "stop"
}
variable "launch_template_instance_type" {
  description = "The type of the instance. If present then instance_requirements cannot be present"
  type        = string
  default     = ""
}
variable "launch_template_kernel_id" {
  description = "The kernel ID"
  type        = string
  default     = ""
}
variable "launch_template_key_name" {
  description = "The key name to use for the instance"
  type        = string
  default     = ""
}
variable "launch_template_name" {
  description = "The name of the launch template. If you leave this blank, Terraform will auto-generate a unique name"
  type        = string
  default     = ""
}
variable "launch_template_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}
variable "launch_template_ram_disk_id" {
  description = "The ID of the RAM disk"
  type        = string
  default     = ""
}
variable "launch_template_security_group_names" {
  description = "A list of security group names to associate with. If you are creating Instances in a VPC, use vpc_security_group_ids instead"
  type        = list(string)
  default     = null
}
variable "launch_template_user_data" {
  description = "The base64-encoded user data to provide when launching the instance"
  type        = string
  default     = ""
}
variable "launch_template_vpc_security_group_ids" {
  description = "A list of security group IDs to associate with. Conflicts with network_interfaces.security_groups "
  type        = list(string)
  default     = null
}
variable "launch_template_block_device_mappings" {
  description = "Specify volumes to attach to the instance besides the volumes specified by the AMI"
  type        = list(object({
    device_name  = optional(string)
    no_device    = optional(string)
    virtual_name = optional(string)
    ebs         = optional(list(object({
      delete_on_termination = optional(bool)
      encrypted             = optional(bool)
      iops                  = optional(number)
      kms_key_id            = optional(string)
      snapshot_id           = optional(string)
      throughput            = optional(number)
      volume_size           = optional(number)
      volume_type           = optional(string)
    })))
  }))
  default     = []
}
variable "launch_template_capacity_reservation_specification" {
  description = "Targeting for EC2 capacity reservations"
  type        = list(object({
    capacity_reservation_preference = optional(string)
    capacity_reservation_target = optional(list(object({
      capacity_reservation_id                 = optional(string)
      capacity_reservation_resource_group_arn = optional(string)
    })))
  }))
  default     = []
}
variable "launch_template_cpu_options" {
  description = "The CPU options for the instance"
  type        = list(object({
    #amd_sev_snp      = optional(string)
    core_count       = optional(number)
    threads_per_core = optional(number)
  }))
  default     = []
}
variable "launch_template_credit_specification" {
  description = "Customize the credit specification of the instance"
  type        = list(object({
    cpu_credits = optional(string)
  }))
  default     = []
}
variable "launch_template_elastic_gpu_specifications" {
  description = "The elastic GPU to attach to the instance"
  type        = list(object({
    type = string
  }))
  default     = []
}
variable "launch_template_elastic_inference_accelerator" {
  description = "Configuration block containing an Elastic Inference Accelerator to attach to the instance"
  type        = list(object({
    type = string
  }))
  default     = []
}
variable "launch_template_enclave_options" {
  description = "Enable Nitro Enclaves on launched instances"
  type        = list(object({
    enabled = optional(bool)
  }))
  default     = []
}
variable "launch_template_hibernation_options" {
  description = "The hibernation options for the instance"
  type        = list(object({
    configured = bool
  }))
  default     = []
}
variable "launch_template_iam_instance_profile" {
  description = "The IAM Instance Profile to launch the instance with"
  type        = list(object({
    arn  = optional(string)
    name = optional(string)
  }))
  default     = []
}
variable "launch_template_instance_market_options" {
  description = "The market (purchasing) option for the instance"
  type        = list(object({
    market_type  = optional(string)
    spot_options = optional(list(object({
      block_duration_minutes         = optional(number)
      instance_interruption_behavior = optional(string)
      max_price                      = optional(string)
      spot_instance_type             = optional(string)
      valid_until                    = optional(string)
    })))
  }))
  default     = []
}
variable "launch_template_instance_requirements" {
  description = "The attribute requirements for the type of instance. If present then instance_type cannot be present"
  type        = list(object({
    accelerator_manufacturers                        = optional(list(string))
    accelerator_names                                = optional(list(string))
    accelerator_types                                = optional(list(string))
    allowed_instance_types                           = optional(list(string))
    bare_metal                                       = optional(string)
    burstable_performance                            = optional(string)
    cpu_manufacturers                                = optional(list(string))
    excluded_instance_types                          = optional(list(string))
    instance_generations                             = optional(list(string))
    local_storage                                    = optional(string)
    local_storage_types                              = optional(list(string))
    on_demand_max_price_percentage_over_lowest_price = optional(number)
    require_hibernate_support                        = optional(bool)
    spot_max_price_percentage_over_lowest_price      = optional(number) 
    accelerator_count = optional(list(object({
      max = optional(number)
      min = optional(number)
    })))
    accelerator_total_memory_mib = optional(list(object({
      max = optional(number)
      min = optional(number)
    })))
    baseline_ebs_bandwidth_mbps = optional(list(object({
      max = optional(number)
      min = optional(number)
    })))
    memory_gib_per_vcpu = optional(list(object({
      max = optional(number)
      min = optional(number)
    })))
    memory_mib = list(object({
      max = optional(number)
      min = number
    }))
    network_bandwidth_gbps = optional(list(object({
      max = optional(number)
      min = optional(number)
    })))
    network_interface_count = optional(list(object({
      max = optional(number)
      min = optional(number)
    })))
    total_local_storage_gb = optional(list(object({
      max = optional(number)
      min = optional(number)
    })))
    vcpu_count = list(object({
      max = optional(number)
      min = number
    }))
  }))
  default     = []
}
variable "launch_template_license_specification" {
  description = "A list of license specifications to associate with"
  type        = list(object({
    license_configuration_arn = string
  }))
  default     = []
}
variable "launch_template_maintenance_options" {
  description = "The maintenance options for the instance"
  type        = list(object({
    auto_recovery = optional(string)
  }))
  default     = []
}
variable "launch_template_metadata_options" {
  description = "Customize the metadata options for the instance"
  type        = list(object({
    http_endpoint                = optional(string)
    http_protocol_ipv6           = optional(string)
    http_put_response_hop_limit  = optional(number)
    http_tokens                  = optional(string)
    instance_metadata_tags       = optional(string)
  }))
  default     = []
}
variable "launch_template_monitoring" {
  description = "The monitoring option for the instance"
  type        = list(object({
    enabled = optional(bool)
  }))
  default     = []
}
variable "launch_template_network_interfaces" {
  description = "Customize network interfaces to be attached at instance boot time"
  type        = list(object({
    associate_carrier_ip_address = optional(bool)
    associate_public_ip_address  = optional(bool)
    delete_on_termination        = optional(bool)
    description                  = optional(string)
    device_index                 = optional(number)
    interface_type               = optional(string)
    ipv4_address_count           = optional(number)
    ipv4_addresses               = optional(list(string))
    ipv4_prefix_count            = optional(number)
    ipv4_prefixes                = optional(list(string))
    ipv6_address_count           = optional(number)
    ipv6_addresses               = optional(list(string))
    ipv6_prefix_count            = optional(number)
    ipv6_prefixes                = optional(list(string))
    network_card_index           = optional(string)
    network_interface_id         = optional(string)
    private_ip_address           = optional(string)
    security_groups              = optional(list(string))
    subnet_id                    = optional(string)
  }))
  default     = []
}
variable "launch_template_placement" {
  description = "The placement of the instance"
  type        = list(object({
    affinity                = optional(string)
    availability_zone       = optional(string)
    group_name              = optional(string)
    host_id                 = optional(string)
    host_resource_group_arn = optional(string)
    partition_number        = optional(number)
    spread_domain           = optional(string)
    tenancy                 = optional(string)
  }))
  default     = []
}
variable "launch_template_private_dns_name_options" {
  description = "The options for the instance hostname. The default values are inherited from the subnet"
  type        = list(object({
    enable_resource_name_dns_aaaa_record = optional(bool)
    enable_resource_name_dns_a_record    = optional(bool)
    hostname_type                        = optional(string)
  }))
  default     = []
}
variable "launch_template_tag_specifications" {
  description = "The tags to apply to the resources during launch"
  type        = list(object({
    resource_type = optional(string)
    tags          = optional(map(string))
  }))
  default     = []
}
