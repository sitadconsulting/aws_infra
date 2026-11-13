variable "datasync_location_object_storage_agent_arns" {
  description = "(Optional) A list of DataSync Agent ARNs with which this location will be associated. For agentless cross-cloud transfers, this parameter does not need to be specified"
  type        = list(string)
  default     = null
}
variable "datasync_location_object_storage_access_key" {
  description = "(Optional) The access key is used if credentials are required to access the self-managed object storage server. If your object storage requires a user name and password to authenticate, use access_key and secret_key to provide the user name and password, respectively"
  type        = string
  default     = null
}
variable "datasync_location_object_storage_bucket_name" {
  description = "(Required) The bucket on the self-managed object storage server that is used to read data from"
  type        = string
}
variable "datasync_location_object_storage_secret_key" {
  description = "(Optional) The secret key is used if credentials are required to access the self-managed object storage server. If your object storage requires a user name and password to authenticate, use access_key and secret_key to provide the user name and password, respectively"
  type        = string
  default     = null
}
variable "datasync_location_object_storage_server_certificate" {
  description = "(Optional) Specifies a certificate to authenticate with an object storage system that uses a private or self-signed certificate authority (CA). You must specify a Base64-encoded .pem string. The certificate can be up to 32768 bytes (before Base64 encoding)"
  type        = string
  default     = null
}
variable "datasync_location_object_storage_server_hostname" {
  description = "(Required) The name of the self-managed object storage server. This value is the IP address or Domain Name Service (DNS) name of the object storage server. An agent uses this host name to mount the object storage server in a network"
  type        = string
}
variable "datasync_location_object_storage_server_protocol" {
  description = "(Optional) The protocol that the object storage server uses to communicate. Valid values are HTTP or HTTPS"
  type        = string
  default     = null
}
variable "datasync_location_object_storage_server_port" {
  description = "(Optional) The port that your self-managed object storage server accepts inbound network traffic on. The server port is set by default to TCP 80 (HTTP) or TCP 443 (HTTPS). You can specify a custom port if your self-managed object storage server requires one"
  type        = number
  default     = null
}
variable "datasync_location_object_storage_subdirectory" {
  description = "(Optional) A subdirectory in the HDFS cluster. This subdirectory is used to read data from or write data to the HDFS cluster. If the subdirectory isn't specified, it will default to /"
  type        = string
  default     = null
}
variable "datasync_location_object_storage_tags" {
  description = "(Optional) Key-value pairs of resource tags to assign to the DataSync Location"
  type        = map(string)
  default     = {}
}
