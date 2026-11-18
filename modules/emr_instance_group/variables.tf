variable "emr_instance_group_autoscaling_policy" {
  description = "(Optional) The Auto Scaling policy document. This is a JSON formatted string"
  type        = string
  default     = null
}
variable "emr_instance_group_bid_price" {
  description = "(Optional) If set, the bid price for each EC2 instance in the instance group, expressed in USD. By setting this attribute, the instance group is being declared as a Spot Instance, and will implicitly create a Spot request. Leave this blank to use On-Demand Instances"
  type        = string
  default     = null
}
variable "emr_instance_group_cluster_id" {
  description = "(Required) ID of the EMR Cluster to attach to. Changing this forces a new resource to be created"
  type        = string
}
variable "emr_instance_group_configurations_json" {
  description = "(Optional) A JSON string for supplying list of configurations specific to the EMR instance group. Note that this can only be changed when using EMR release 5.21 or later"
  type        = string
  default     = null
}
variable "emr_instance_group_ebs_optimized" {
  description = "(Optional) Indicates whether an Amazon EBS volume is EBS-optimized. Changing this forces a new resource to be created"
  type        = bool
  default     = null
}
variable "emr_instance_group_instance_type" {
  description = "(Required) The EC2 instance type for all instances in the instance group. Changing this forces a new resource to be created"
  type        = string
}
variable "emr_instance_group_instance_count" {
  description = "(Optional) target number of instances for the instance group. defaults to 0"
  type        = number
  default     = null
}
variable "emr_instance_group_name" {
  description = "(Required) Human friendly name given to the instance group. Changing this forces a new resource to be created"
  type        = string
}
variable "emr_instance_group_ebs_config" {
  description = "(Optional) One or more ebs_config blocks as defined below. Changing this forces a new resource to be created"
  type        = list(object({
    iops                 = optional(number)
    size                 = number
    type                 = string
    volumes_per_instance = optional(number)
  }))
  default     = []
}
