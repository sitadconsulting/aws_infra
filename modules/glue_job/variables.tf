variable "glue_job_connections" {
  description = "The list of connections used for this job"
  type        = list(string)
  default     = []
}
variable "glue_job_default_arguments" {
  description = "The map of default arguments for this job. You can specify arguments here that your own job-execution script consumes, as well as arguments that AWS Glue itself consumes"
  type        = map(string)
  default     = {}
}
variable "glue_job_description" {
  description = "Description of the job"
  type        = string
  default     = ""
}
variable "glue_job_execution_class" {
  description = "Indicates whether the job is run with a standard or flexible execution class. The standard execution class is ideal for time-sensitive workloads that require fast job startup and dedicated resources. Valid value: FLEX, STANDARD"
  type        = string
  default     = "FLEX"
}
variable "glue_job_glue_version" {
  description = "The version of glue to use"
  type        = string
  default     = ""
}
variable "glue_job_max_capacity" {
  description = "The maximum number of AWS Glue data processing units (DPUs) that can be allocated when this job runs. Required when pythonshell is set, accept either 0.0625 or 1.0. Use number_of_workers and worker_type arguments instead with glue_version 2.0 and above"
  type        = number
  default     = null
}
variable "glue_job_max_retries" {
  description = "The maximum number of times to retry this job if it fails"
  type        = number
  default     = null
}
variable "glue_job_name" {
  description = "The name you assign to this job. It must be unique in your account"
  type        = string
}
variable "glue_job_non_overridable_arguments" {
  description = "Non-overridable arguments for this job, specified as name-value pairs"
  type        = map(string)
  default     = {}
}
variable "glue_job_number_of_workers" {
  description = "The number of workers of a defined workerType that are allocated when a job runs"
  type        = number
  default     = null
}
variable "glue_job_role_arn" {
  description = "The ARN of the IAM role associated with this job"
  type        = string
}
variable "glue_job_security_configuration" {
  description = "The name of the Security Configuration to be associated with the job"
  type        = string
  default     = ""
}
variable "glue_job_tags" {
  description = "Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "glue_job_timeout" {
  description = "The job timeout in minutes. The default is 2880 minutes (48 hours) for glueetl and pythonshell jobs, and null (unlimited) for gluestreaming jobs"
  type        = number
  default     = null
}
variable "glue_job_worker_type" {
  description = "The type of predefined worker that is allocated when a job runs. Accepts a value of Standard, G.1X, or G.2X"
  type        = string
  default     = null
}
variable "glue_job_command" {
  description = "The command of the job"
  type        = list(object({
    name            = optional(string)
    script_location = string
    python_version  = optional(string)
  }))
  default     = []
}
variable "glue_job_execution_property" {
  description = "Execution property of the job"
  type        = list(object({
    max_concurrent_runs = optional(number)
  }))
  default     = []
}
variable "glue_job_notification_property" {
  description = "Notification property of the job"
  type        = list(object({
    notify_delay_after = optional(number)
  }))
  default     = []
}
