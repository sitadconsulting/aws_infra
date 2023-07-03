variable "service_metadata_annotations" {
  description = "An unstructured key value map stored with the Service that may be used to store arbitrary metadata"
  type        = map(string)
  default     = {}
}
variable "service_metadata_labels" {
  description = "Map of string keys and values that can be used to organize and categorize (scope and select) the Service"
  type        = map(string)
  default     = {}
}
variable "service_metadata_name" {
  description = "Name of the Service, must be unique. Cannot be updated"
  type        = string
  default     = ""
}
variable "service_metadata_namespace" {
  description = "Namespace defines the space within which name of the Service must be unique"
  type        = string
  default     = ""
}
variable "service_wait_for_load_balancer" {
  description = "Terraform will wait for the load balancer to have at least 1 endpoint before considering the resource created. Defaults to true"
  type        = bool
  default     = true
}
variable "service_spec_allocate_load_balancer_node_ports" {
  description = "Defines if NodePorts will be automatically allocated for services with type LoadBalancer Default is true "
  type        = bool
  default     = true
}
variable "service_spec_cluster_ip" {
  description = "The IP address of the service. It is usually assigned randomly by the master."
  type        = string
  default     = null
}
variable "service_spec_cluster_ips" {
  description = "List of IP addresses assigned to this service, and are usually assigned randomly"
  type        = list(string)
  default     = []
}
variable "service_spec_external_ips" {
  description = "A list of IP addresses for which nodes in the cluster will also accept traffic for this service. These IPs are not managed by Kubernetes"
  type        = list(string)
  default     = []
}
variable "service_spec_external_name" {
  description = "The external reference that kubedns or equivalent will return as a CNAME record for this service"
  type        = string
  default     = null
}
variable "service_spec_external_traffic_policy" {
  description = "Denotes if this Service desires to route external traffic to node-local or cluster-wide endpoints. Local or Cluster"
  type        = string
  default     = "Cluster"
}
variable "service_spec_ip_families" {
  description = "A list of IP families (IPv4, IPv6) assigned to this service. This field is usually assigned automatically based on cluster configuration and the ip_family_policy field"
  type        = list(string)
  default     = []
}
variable "service_spec_ip_family_policy" {
  description = "Represents the dual-stack-ness requested or required by this Service. If there is no value provided, then this field will be set to SingleStack"
  type        = string
  default     = null
}
variable "service_spec_internal_traffic_policy" {
  description = "Specifies if the cluster internal traffic should be routed to all endpoints or node-local endpoints only. Cluster is default"
  type        = string
  default     = "Cluster"
}
variable "service_spec_load_balancer_class" {
  description = "The class of the load balancer implementation this Service belongs to. If specified, the value of this field must be a label-style identifier, with an optional prefix"
  type        = string
  default     = ""
}
variable "service_spec_load_balancer_ip" {
  description = "Only applies to type = LoadBalancer. LoadBalancer will get created with the IP specified in this field"
  type        = string
  default     = null
}
variable "service_spec_load_balancer_source_ranges" {
  description = "If specified and supported by the platform, this will restrict traffic through the cloud-provider load-balancer will be restricted to the specified client IPs"
  type        = list(string)
  default     = []
}
variable "service_spec_port" {
  description = "The list of ports that are exposed by this service"
  type        = list(object({
    app_protocol = optional(number)
    name         = optional(string)
    node_port    = optional(number)
    port         = number
    protocol     = optional(string)
    target_port  = optional(number)
  }))
  default     = []
}
variable "service_spec_publish_not_ready_addresses" {
  description = "When set to true, indicates that DNS implementations must publish the notReadyAddresses of subsets for the Endpoints associated with the Service. Default value is false"
  type        = bool
  default     = false
}
variable "service_spec_selector" {
  description = "Route service traffic to pods with label keys and values matching this selector. Only applies to types ClusterIP, NodePort, and LoadBalancer"
  type        = map(string)
  default     = null
}
variable "service_spec_session_affinity" {
  description = "Used to maintain session affinity. Supports ClientIP and None. Defaults to None"
  type        = string
  default     = "None"
}
variable "service_spec_session_affinity_config" {
  description = "Contains the configurations of session affinity"
  type        = map(object({
    client_ip = map(object({
      timeout_seconds = optional(number)
    }))
  }))
  default     = {}
}
variable "service_spec_type" {
  description = "Determines how the service is exposed. Defaults to ClusterIP. Valid options are ExternalName, ClusterIP, NodePort, LoadBalancer and  ExternalName"
  type        = string
  default     = "ClusterIP"
}
variable "service_spec_health_check_node_port" {
  description = "Specifies the Healthcheck NodePort for the service. Only effects when type is set to LoadBalancer and external_traffic_policy is set to Local"
  type        = number
  default     = null
}
