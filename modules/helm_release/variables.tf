variable "release_atomic" {
  description = "If set, installation process purges chart on fail. The wait flag will be set automatically if atomic is used. Defaults to false"
  type        = bool
  default     = false
}
variable "release_chart" {
  description = "Chart name to be installed. The chart name can be local path, a URL to a chart, or the name of the chart if repository is specified. It is also possible to use the <repository>/<chart> format here if you are running Terraform on a system that the repository has been added to with helm repo add but this is not recommended"
  type        = string
}
variable "release_cleanup_on_fail" {
  description = "Allow deletion of new resources created in this upgrade when upgrade fails. Defaults to false"
  type        = bool
  default     = false
}
variable "release_create_namespace" {
  description = "Create the namespace if it does not yet exist. Defaults to false"
  type        = bool
  default     = false
}
variable "release_dependency_update" {
  description = "Runs helm dependency update before installing the chart. Defaults to false"
  type        = bool
  default     = false
}
variable "release_description" {
  description = "Set release description attribute (visible in the history)"
  type        = string
  default     = ""
}
variable "release_devel" {
  description = "Use chart development versions, too. Equivalent to version '>0.0.0-0'. If version is set, this is ignored"
  type        = bool
  default     = false
}
variable "release_disable_openapi_validation" {
  description = "If set, the installation process will not validate rendered templates against the Kubernetes OpenAPI Schema "
  type        = bool
  default     = false
}
variable "release_disable_webhooks" {
  description = "Prevent hooks from running. Defaults to false"
  type        = bool
  default     = false
}
variable "release_force_update" {
  description = "Force resource update through delete/recreate if needed. Defaults to false"
  type        = bool
  default     = false
}
variable "release_keyring" {
  description = "Location of public keys used for verification. Used only if verify is true. Defaults to /.gnupg/pubring.gpg in the location set by home"
  type        = string
  default     = ""
}
variable "release_lint" {
  description = "Run the helm chart linter during the plan. Defaults to false"
  type        = bool
  default     = false
}
variable "release_max_history" {
  description = "Maximum number of release versions stored per release. Defaults to 0 (no limit)"
  type        = number
  default     = null
}
variable "release_name" {
  description = "Release name"
  type        = string
}
variable "release_namespace" {
  description = "The namespace to install the release into. Defaults to default"
  type        = string
  default     = ""
}
variable "release_pass_credentials" {
  description = "Pass credentials to all domains. Defaults to false"
  type        = bool
  default     = false
}
variable "release_recreate_pods" {
  description = "Perform pods restart during upgrade/rollback. Defaults to false"
  type        = bool
  default     = false
}
variable "release_render_subchart_notes" {
  description = "If set, render subchart notes along with the parent. Defaults to true"
  type        = bool
  default     = true
}
variable "release_replace" {
  description = "Re-use the given name, only if that name is a deleted release which remains in the history. This is unsafe in production. Defaults to false"
  type        = bool
  default     = false
}
variable "release_repository" {
  description = "Repository URL where to locate the requested chart"
  type        = string
  default     = ""
}
variable "release_repository_ca_file" {
  description = "The Repositories CA File"
  type        = string
  default     = ""
}
variable "release_repository_cert_file" {
  description = "The repositories cert file"
  type        = string
  default     = ""
}
variable "release_repository_key_file" {
  description = "The repositories cert key file"
  type        = string
  default     = ""
}
variable "release_repository_password" {
  description = "Password for HTTP basic authentication against the repository"
  type        = string
  default     = ""
}
variable "release_repository_username" {
  description = "Username for HTTP basic authentication against the repository"
  type        = string
  default     = ""
}
variable "release_reset_values" {
  description = "When upgrading, reset the values to the ones built into the chart. Defaults to false"
  type        = bool
  default     = false
}
variable "release_reuse_values" {
  description = "When upgrading, reuse the last release's values and merge in any overrides. If 'reset_values' is specified, this is ignored. Defaults to false"
  type        = bool
  default     = false
}
variable "release_skip_crds" {
  description = "If set, no CRDs will be installed. By default, CRDs are installed if not already present. Defaults to false"
  type        = bool
  default     = false
}
variable "release_timeout" {
  description = "Time in seconds to wait for any individual kubernetes operation (like Jobs for hooks). Defaults to 300 seconds"
  type        = number
  default     = 300
}
variable "release_values" {
  description = "List of values in raw yaml to pass to helm. Values will be merged, in order, as Helm does with multiple -f options"
  type        = list(string)
  default     = []
}
variable "release_verify" {
  description = "Verify the package before installing it. Helm uses a provenance file to verify the integrity of the chart; this must be hosted alongside the chart. Defaults to false"
  type        = bool
  default     = false
}
variable "release_version" {
  description = "Specify the exact chart version to install. If this is not specified, the latest version is installed. helm_release will not automatically grab the latest release, version must explicitly upgraded when upgrading an installed chart"
  type        = string
  default     = ""
}
variable "release_wait" {
  description = "Will wait until all resources are in a ready state before marking the release as successful. It will wait for as long as timeout. Defaults to true"
  type        = bool
  default     = true
}
variable "release_wait_for_jobs" {
  description = "If wait is enabled, will wait until all Jobs have been completed before marking the release as successful. It will wait for as long as timeout. Defaults to false"
  type        = bool
  default     = false
}
variable "release_postrender" {
  description = "Configure a command to run after helm renders the manifest which can alter the manifest contents"
  type        = list(object({
    binary_path = string
    args        = optional(list(string))
  }))
  default     = []
}
variable "release_set" {
  description = "Value block with custom values to be merged with the values yaml"
  type        = list(object({
    name  = string
    type  = optional(string)
    value = string 
  }))
  default     = []
}
#variable "release_set_list" {
#  description = "Value block with list of custom values to be merged with the values yaml"
#  type        = list(object({
#    name  = string
#    value = list(string)
#  }))
#  default     = []
#}
variable "release_set_sensitive" {
  description = "Value block with custom sensitive values to be merged with the values yaml that won't be exposed in the plan's diff"
  type        = list(object({
    name  = string
    type  = optional(string)
    value = string 
  }))
  default     = []
}
