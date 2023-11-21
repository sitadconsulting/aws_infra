variable "efs_file_system_policy_bypass_policy_lockout_safety_check" {
  description = "A flag to indicate whether to bypass the aws_efs_file_system_policy lockout safety check. The policy lockout safety check determines whether the policy in the request will prevent the principal making the request will be locked out from making future PutFileSystemPolicy requests on the file system. Set bypass_policy_lockout_safety_check to true only when you intend to prevent the principal that is making the request from making a subsequent PutFileSystemPolicy request on the file system. The default value is false"
  type        = bool
  default     = false
}
variable "efs_file_system_policy_file_system_id" {
  description = "The ID of the EFS file system"
  type        = string
}
variable "efs_file_system_policy_policy" {
  description = "The JSON formatted file system policy for the EFS file system"
  type        = string
}
