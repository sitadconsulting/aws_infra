variable "kms_custom_key_store_cloud_hsm_cluster_id" {
  description = "(Optional) Cluster ID of CloudHSM. Applies when custom_key_store_type is AWS_CLOUDHSM"
  type        = string
  default     = null
}
variable "kms_custom_key_store_custom_key_store_name" {
  description = "(Required) Unique name for Custom Key Store"
  type        = string
}
variable "kms_custom_key_store_custom_key_store_type" {
  description = "(Optional, ForceNew) Type of key store to create. Valid values are AWS_CLOUDHSM and EXTERNAL_KEY_STORE. If omitted, AWS will default the value to AWS_CLOUDHSM"
  type        = string
  default     = null
}
variable "kms_custom_key_store_key_store_password" {
  description = "(Optional) Password for the kmsuser of an AWS CloudHSM key store. Applies when custom_key_store_type is AWS_CLOUDHSM"
  type        = string
  default     = null
}
variable "kms_custom_key_store_trust_anchor_certificate" {
  description = "(Optional) Certificate for an AWS CloudHSM key store. Applies when custom_key_store_type is AWS_CLOUDHSM"
  type        = string
  default     = null
}
variable "kms_custom_key_store_xks_proxy_connectivity" {
  description = "(Optional) How AWS KMS communicates with the external key store proxy. Applies when custom_key_store_type is EXTERNAL_KEY_STORE"
  type        = string
  default     = null
}
variable "kms_custom_key_store_xks_proxy_uri_endpoint" {
  description = "(Optional) Endpoint that AWS KMS uses to send requests to the external key store proxy (XKS proxy). Applies when custom_key_store_type is EXTERNAL_KEY_STORE"
  type        = string
  default     = null
}
variable "kms_custom_key_store_xks_proxy_uri_path" {
  description = "(Optional) Base path to the proxy APIs for this external key store. To find this value, see the documentation for your external key store proxy. Applies when custom_key_store_type is EXTERNAL_KEY_STORE"
  type        = string
  default     = null
}
variable "kms_custom_key_store_xks_proxy_vpc_endpoint_service_name" {
  description = "(Optional) Name of the Amazon VPC endpoint service for interface endpoints that is used to communicate with your external key store proxy (XKS proxy). Applies when custom_key_store_type is EXTERNAL_KEY_STORE and required when xks_proxy_connectivity is VPC_ENDPOINT_SERVICE"
  type        = string
  default     = null
}
variable "kms_custom_key_store_xks_proxy_authentication_credential" {
  description = "(Optional) Authentication credential for the external key store proxy (XKS proxy). Applies when custom_key_store_type is EXTERNAL_KEY_STORE"
  type        = list(object({
    access_key_id         = string
    raw_secret_access_key = string
  }))
  default     = []
}
