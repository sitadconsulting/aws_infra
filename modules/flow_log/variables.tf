variable "flow_log_deliver_cross_account_role" {
  description = "(Optional) ARN of the IAM role in the destination account used for cross-account delivery of flow logs"
  type        = string
  default     = null
}
variable "flow_log_eni_id" {
  description = "(Optional) Elastic Network Interface ID to attach to"
  type        = string
  default     = null
}
variable "flow_log_iam_role_arn" {
  description = "(Optional) ARN of the IAM role used to post flow logs. Corresponds to DeliverLogsPermissionArn in the AWS API"
  type        = string
  default     = null
}
variable "flow_log_log_destination" {
  description = "(Optional) ARN of the logging destination"
  type        = string
  default     = null
}
variable "flow_log_log_destination_type" {
  description = "(Optional) Logging destination type. Valid values: cloud-watch-logs, s3, kinesis-data-firehose. Default: cloud-watch-logs"
  type        = string
  default     = null
}
variable "flow_log_log_format" {
  description = "(Optional) Fields to include in the flow log record. Accepted format example: \"$$\{interface-id\} $$\{srcaddr}\ $$\{dstaddr\} $$\{srcport\} $$\{dstport\}\""
  type        = string
  default     = null
}
variable "flow_log_max_aggregation_interval" {
  description = "(Optional) Maximum interval of time during which a flow of packets is captured and aggregated into a flow log record. Valid Values: 60 seconds (1 minute) or 600 seconds (10 minutes). Default: 600. When transit_gateway_id or transit_gateway_attachment_id is specified, max_aggregation_interval must be 60 seconds (1 minute)"
  type        = number
  default     = null
}
variable "flow_log_regional_nat_gateway_id" {
  description = "(Optional) Regional NAT Gateway ID to attach to"
  type        = string
  default     = null
}
variable "flow_log_subnet_id" {
  description = "(Optional) Subnet ID to attach to"
  type        = string
  default     = null
}
variable "flow_log_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "flow_log_traffic_type" {
  description = "(Optional) Type of traffic to capture. Valid values: ACCEPT,REJECT, ALL. Required if eni_id, regional_nat_gateway_id, subnet_id, or vpc_id is specified"
  type        = string
  default     = null
}
variable "flow_log_transit_gateway_attachment_id" {
  description = "(Optional) Transit Gateway Attachment ID to attach to"
  type        = string
  default     = null
}
variable "flow_log_transit_gateway_id" {
  description = "(Optional) Transit Gateway ID to attach to"
  type        = string
  default     = null
}
variable "flow_log_vpc_id" {
  description = "(Optional) VPC ID to attach to"
  type        = string
  default     = null
}
variable "flow_log_destination_options" {
  description = "(Optional) Destination options for a flow log"
  type        = list(object({
    file_format                = optional(string)
    hive_compatible_partitions = optional(bool)
    per_hour_partition         = optional(bool)
  }))
  default     = []
}
variable "flow_log_tag_field_specification" {
  description = "(Optional) Tag configuration for the Flow Logs Amazon EC2 Tags feature fields (e.g., $${instance-tag}) used in log_format"
  type        = list(object({
    resource_type = string
    tag_keys      = list(string)
  }))
  default     = []
}
