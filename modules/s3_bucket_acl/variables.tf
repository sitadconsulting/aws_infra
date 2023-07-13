variable "s3_bucket_acl_acl" {
  description = "Canned ACL to apply to the bucket"
  type        = string
  default     = ""
}
variable "s3_bucket_acl_bucket" {
  description = "Name of the bucket"
  type        = string
}
variable "s3_bucket_acl_expected_bucket_owner" {
  description = "Account ID of the expected bucket owner"
  type        =
  default     = 
}
variable "s3_bucket_acl_access_control_policy" {
  description = "Configuration of object ACL permissions per grantee"
  type        = list(object({
    grant     = optional(list(object({
      permission = string
      grantee    = optional(list(object({
        email_address = optional(string)
        id            = optional(string)
        type          = string
        uri           = optional(string)   
      })), [])
    })), [])
    owner     = list(object({
      display_name = optional(string)
      id           = string
    }))
  }))
  default     = []
}
