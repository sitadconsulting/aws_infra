variable "redshift_partner_account_id" {
  description = "The Amazon Web Services account ID that owns the cluster"
  type        = string
}
variable "redshift_partner_cluster_identifier" {
  description = "The cluster identifier of the cluster that receives data from the partner"
  type        = string
}
variable "redshift_partner_database_name" {
  description = "The name of the database that receives data from the partner"
  type        = string
}
variable "redshift_partner_partner_name" {
  description = "The name of the partner that is authorized to send data"
  type        = string
}
