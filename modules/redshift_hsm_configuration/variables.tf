variable "redshift_hsm_configuration_description" {
  description = "A text description of the HSM configuration to be created"
  type        = string
}
variable "redredshift_hsm_configuration_hsm_configuration_identifier" {
  description = "The identifier to be assigned to the new Amazon Redshift HSM configuration"
  type        = string
}
variable "redredshift_hsm_configuration_hsm_ip_address" {
  description = "The IP address that the Amazon Redshift cluster must use to access the HSM"
  type        = string
}
variable "redredshift_hsm_configuration_hsm_partition_name" {
  description = "The name of the partition in the HSM where the Amazon Redshift clusters will store their database encryption keys"
  type        = string
}
variable "redredshift_hsm_configuration_hsm_partition_password" {
  description = "The password required to access the HSM partition"
  type        = string
}
variable "redredshift_hsm_configuration_hsm_server_public_certificate" {
  description = "The HSMs public certificate file. When using Cloud HSM, the file name is server.pem"
  type        = string
}
variable "redredshift_hsm_configuration_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
