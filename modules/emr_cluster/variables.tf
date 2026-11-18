variable "emr_cluster_additional_info" {
  description = "(Optional) JSON string for selecting additional features such as adding proxy information. Note: Currently there is no API to retrieve the value of this argument after EMR cluster creation from provider, therefore Terraform cannot detect drift from the actual EMR cluster if its value is changed outside Terraform"
  type        = string
  default     = null
}
variable "emr_cluster_applications" {
  description = "(Optional) A case-insensitive list of applications for Amazon EMR to install and configure when launching the cluster. For a list of applications available for each Amazon EMR release version, see the Amazon EMR Release Guide"
  type        = list(string)
  default     = null
}
variable "emr_cluster_autoscaling_role" {
  description = "(Optional) IAM role for automatic scaling policies. The IAM role provides permissions that the automatic scaling feature requires to launch and terminate EC2 instances in an instance group"
  type        = string
  default     = null
}
variable "emr_cluster_configurations" {
  description = "(Optional) List of configurations supplied for the EMR cluster you are creating, expressed as a string: an HTTP(S) URL to a JSON file, a path to a local .json file, or a raw JSON string. To supply configuration objects using Terraform syntax instead, use configurations_json"
  type        = string
  default     = null
}
variable "emr_cluster_configurations_json" {
  description = "(Optional) JSON string for supplying list of configurations for the EMR cluster"
  type        = string
  default     = null
}
variable "emr_cluster_custom_ami_id" {
  description = "(Optional) Custom Amazon Linux AMI for the cluster (instead of an EMR-owned AMI). Available in Amazon EMR version 5.7.0 and later"
  type        = string
  default     = null
}
variable "emr_cluster_ebs_root_volume_size" {
  description = "(Optional) Size in GiB of the EBS root device volume of the Linux AMI that is used for each EC2 instance. Available in Amazon EMR version 4.x and later"
  type        = number
  default     = null
}
variable "emr_cluster_keep_job_flow_alive_when_no_steps" {
  description = "(Optional) Switch on/off run cluster with no steps or when all steps are complete (default is on)"
  type        = bool
  default     = null
}
variable "emr_cluster_list_steps_states" {
  description = "(Optional) List of step states used to filter returned steps"
  type        = list(string)
  default     = null
}
variable "emr_cluster_log_encryption_kms_key_id" {
  description = "(Optional) AWS KMS customer master key (CMK) key ID or ARN used for encrypting log files. This attribute is only available with EMR version 5.30.0 and later, excluding EMR 6.0.0"
  type        = string
  default     = null
}
variable "emr_cluster_log_uri" {
  description = "(Optional) S3 bucket to write the log files of the job flow. If a value is not provided, logs are not created"
  type        = string
  default     = null
}
variable "emr_cluster_name" {
  description = "(Required) The name of the cluster. This parameter can't contain the characters <, >, $, |, or ` (backtick)"
  type        = string
}
variable "emr_cluster_os_release_label" {
  description = "(Optional) Amazon Linux release for all nodes in a cluster launch RunJobFlow request. If not specified, Amazon EMR uses the latest validated Amazon Linux release for cluster launch"
  type        = string
  default     = null
}
variable "emr_cluster_release_label" {
  description = "(Required) Release label for the Amazon EMR release"
  type        = string
}
variable "emr_cluster_scale_down_behavior" {
  description = "(Optional) Way that individual Amazon EC2 instances terminate when an automatic scale-in activity occurs or an instance group is resized"
  type        = string
  default     = null
}
variable "emr_cluster_security_configuration" {
  description = "(Optional) Security configuration name to attach to the EMR cluster. Only valid for EMR clusters with release_label 4.8.0 or greater"
  type        = string
  default     = null
}
variable "emr_cluster_service_role" {
  description = "(Required) IAM role that will be assumed by the Amazon EMR service to access AWS resources"
  type        = string
}
variable "emr_cluster_step_concurrency_level" {
  description = "(Optional) Number of steps that can be executed concurrently. You can specify a maximum of 256 steps. Only valid for EMR clusters with release_label 5.28.0 or greater (default is 1)"
  type        = number
  default     = null
}
variable "emr_cluster_tags" {
  description = "(Optional) list of tags to apply to the EMR Cluster"
  type        = map(string)
  default     = {}
}
variable "emr_cluster_termination_protection" {
  description = "(Optional) Switch on/off termination protection (default is false, except when using multiple master nodes). Before attempting to destroy the resource when termination protection is enabled, this configuration must be applied with its value set to false"
  type        = bool
  default     = false
}
variable "emr_cluster_unhealthy_node_replacement" {
  description = "(Optional) Whether Amazon EMR should gracefully replace core nodes that have degraded within the cluster. Default value is false"
  type        = bool
  default     = false
}
variable "emr_cluster_visible_to_all_users" {
  description = "(Optional) Whether the job flow is visible to all IAM users of the AWS account associated with the job flow. Default value is true"
  type        = bool
  default     = true
}
variable "emr_cluster_auto_termination_policy" {
  description = "(Optional) An auto-termination policy for an Amazon EMR cluster. An auto-termination policy defines the amount of idle time in seconds after which a cluster automatically terminates"
  type        = list(object({
    idle_timeout = optional(number)
  }))
  default     = []
}
variable "emr_cluster_bootstrap_action" {
  description = "(Optional) Ordered list of bootstrap actions that will be run before Hadoop is started on the cluster nodes"
  type        = list(object({
    args = optional(list(string))
    name = string
    path = string
  }))
  default     = []
}
variable "emr_cluster_core_instance_fleet" {
  description = "(Optional) Configuration block to use an Instance Fleet for the core node type. Cannot be specified if any core_instance_group configuration blocks are set"
  type        = list(object({
    name                      = optional(string)
    target_on_demand_capacity = optional(number)
    target_spot_capacity      = optional(number)
    instance_type_configs     = optional(list(object({
      bid_price                                  = optional(string)
      bid_price_as_percentage_of_on_demand_price = optional(number)
      instance_type                              = string
      weighted_capacity                          = optional(number)
      configurations                             = optional(list(object({
        classification = optional(string)
        properties     = optional(map(string))
      })), [])
      ebs_config                                 = optional(list(object({
        iops                 = optional(number)
        size                 = number
        type                 = string
        volumes_per_instance = optional(number)
      })), [])
    })), [])
    launch_specifications     = optional(list(object({
      on_demand_specification = optional(list(object({
        allocation_strategy = string
      })), [])
      spot_specification      = optional(list(object({
        allocation_strategy      = string
        block_duration_minutes   = optional(number)
        timeout_action           = string
        timeout_duration_minutes = number
      })), []) 
    })), [])
  }))
  default     = []
}
variable "emr_cluster_core_instance_group" {
  description = "(Optional) Configuration block to use an Instance Group for the core node type"
  type        = list(object({
    autoscaling_policy = optional(string)
    bid_price          = optional(string)
    instance_count     = optional(number)
    instance_type      = string
    name               = optional(string)
    ebs_config         = optional(list(object({
      iops                 = optional(number)
      size                 = number
      throughput           = optional(number)
      type                 = string
      volumes_per_instance = optional(number)
    })), [])
  }))
  default     = []
}
variable "emr_cluster_ec2_attributes" {
  description = "(Optional) Attributes for the EC2 instances running the job flow"
  type        = list(object({
    additional_master_security_groups = optional(string)
    additional_slave_security_groups  = optional(string)
    emr_managed_master_security_group = optional(string)
    emr_managed_slave_security_group  = optional(string)
    instance_profile                  = string
    key_name                          = optional(string)
    service_access_security_group     = optional(string)
    subnet_id                         = optional(string)
    subnet_ids                        = optional(list(string))
  }))
  default     = []
}
variable "emr_cluster_kerberos_attributes" {
  description = "(Optional) Kerberos configuration for the cluster"
  type        = list(object({
    ad_domain_join_password              = optional(string)
    ad_domain_join_user                  = optional(string)
    cross_realm_trust_principal_password = optional(string)
    kdc_admin_password                   = string
    realm                                = string
  }))
  default     = []
}
variable "emr_cluster_master_instance_fleet" {
  description = "(Optional) Configuration block to use an Instance Fleet for the master node type. Cannot be specified if any master_instance_group configuration blocks are set"
  type        = list(object({
    name                      = optional(string)
    target_on_demand_capacity = optional(number)
    target_spot_capacity      = optional(number)
    instance_type_configs     = optional(list(object({
      bid_price                                  = optional(string)
      bid_price_as_percentage_of_on_demand_price = optional(number)
      instance_type                              = string
      weighted_capacity                          = optional(number)
      configurations                             = optional(list(object({
        classification = optional(string)
        properties     = optional(map(string))
      })), [])
      ebs_config                                 = optional(list(object({
        iops                 = optional(number)
        size                 = number
        type                 = string
        volumes_per_instance = optional(number)
      })), [])
    })), [])
    launch_specifications     = optional(list(object({
      on_demand_specification = optional(list(object({
        allocation_strategy = string
      })), [])
      spot_specification      = optional(list(object({
        allocation_strategy      = string
        block_duration_minutes   = optional(number)
        timeout_action           = string
        timeout_duration_minutes = number
      })), []) 
    })), [])
  }))
  default     = []
}
variable "emr_cluster_master_instance_group" {
  description = "(Optional) Configuration block to use an Instance Group for the master node type"
  type        = list(object({
    bid_price      = optional(string)
    instance_count = optional(number)
    instance_type  = string
    name           = optional(string)
    ebs_config = optional(list(object({
      iops                 = optional(number)
      size                 = number
      throughput           = optional(number)
      type                 = string
      volumes_per_instance = optional(number)
    })), [])
  }))
  default     = []
}
variable "emr_cluster_placement_group_config" {
  description = "(Optional) The specified placement group configuration for an Amazon EMR cluster"
  type        = list(object({
    instance_role      = string
    placement_strategy = optional(string)
  }))
  default     = []
}
variable "emr_cluster_step" {
  description = "(Optional) List of steps to run when creating the cluster. See below. It is highly recommended to utilize the lifecycle configuration block with ignore_changes if other steps are being managed outside of Terraform. This argument is processed in attribute-as-blocks mode"
  type        = list(object({
    action_on_failure = string
    name              = string
    hadoop_jar_step   = list(object({
      args       = optional(list(string))
      jar        = string
      main_class = optional(string)
      properties = optional(map(string))
    }))
  }))
  default     = []
} 
