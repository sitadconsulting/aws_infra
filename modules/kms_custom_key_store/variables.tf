variable "kms_custom_key_store_cloud_hsm_cluster_id" {
  description = "Cluster ID of CloudHSM "
  type        = string
}
variable "kms_custom_key_store_custom_key_store_name" {
  description = "Unique name for Custom Key Store"
  type        = string
}
variable "kms_custom_key_store_key_store_password" {
  description = "Password for kmsuser on CloudHSM"
  type        = string
}
variable "kms_custom_key_store_trust_anchor_certificate" {
  description = "Customer certificate used for signing on CloudHSM"
  type        = string
}
