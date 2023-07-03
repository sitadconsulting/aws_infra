variable "opensearchserverless_collection_description" {
  description = "Description of the collection"
  type        = string
  default     = ""
}
variable "opensearchserverless_collection_name" {
  description = "Name of the collection"
  type        = string
}
variable "opensearchserverless_collection_tags" {
  description = "A map of tags to assign to the collection"
  type        = map(string)
  default     = {}
}
variable "opensearchserverless_collection_type" {
  description = "Type of collection. One of SEARCH or TIMESERIES"
  type        = string
  default     = null
}
