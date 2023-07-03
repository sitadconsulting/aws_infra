variable "glue_dev_endpoint_arguments" {
  description = "A map of arguments used to configure the endpoint"
  type        = map(string)
  default     = {}
}
variable "glue_dev_endpoint_extra_jars_s3_path" {
  description = "Path to one or more Java Jars in an S3 bucket that should be loaded in this endpoint"
  type        = string
  default     = ""
}
variable "glue_dev_endpoint_extra_python_libs_s3_path" {
  description = "Path(s) to one or more Python libraries in an S3 bucket that should be loaded in this endpoint. Multiple values must be complete paths separated by a comma"
  type        = string
  default     = ""
}
variable "glue_dev_endpoint_glue_version" {
  description = "Specifies the versions of Python and Apache Spark to use. Defaults to AWS Glue version 0.9"
  type        = string
  default     = ""
}
variable "glue_dev_endpoint_name" {
  description = "The name of this endpoint. It must be unique in your account"
  type        = string
}
variable "glue_dev_endpoint_number_of_nodes" {
  description = "The number of AWS Glue Data Processing Units (DPUs) to allocate to this endpoint. Conflicts with worker_type"
  type        = number
  default     = null
}
variable "glue_dev_endpoint_number_of_workers" {
  description = "The number of workers of a defined worker type that are allocated to this endpoint. This field is available only when you choose worker type G.1X or G.2X"
  type        = number
  default     = null
}
variable "glue_dev_endpoint_public_key" {
  description = "The public key to be used by this endpoint for authentication"
  type        = string
  default     = ""
}
variable "glue_dev_endpoint_public_keys" {
  description = "A list of public keys to be used by this endpoint for authentication"
  type        = list(string)
  default     = []
}
variable "glue_dev_endpoint_role_arn" {
  description = "The IAM role for this endpoint"
  type        = string
}
variable "glue_dev_endpoint_security_configuration" {
  description = "The name of the Security Configuration structure to be used with this endpoint"
  type        = string
  default     = ""
}
variable "glue_dev_endpoint_security_group_ids" {
  description = "Security group IDs for the security groups to be used by this endpoint"
  type        = list(string)
  default     = []
}
variable "glue_dev_endpoint_subnet_id" {
  description = "The subnet ID for the new endpoint to use"
  type        = string
  default     = ""
}
variable "glue_dev_endpoint_tags" {
  description = "Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "glue_dev_endpoint_worker_type" {
  description = "The type of predefined worker that is allocated to this endpoint. Accepts a value of Standard, G.1X, or G.2X"
  type        = string
  default     = ""
}
