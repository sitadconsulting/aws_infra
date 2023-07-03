variable "redshift_authentication_profile_authentication_profile_name" {
  description = "The name of the authentication profile"
  type        = string
}
variable "redshift_authentication_profile_authentication_profile_content" {
  description = "The content of the authentication profile in JSON format. The maximum length of the JSON string is determined by a quota for your account"
  type        = string
}
