variable "codebuild_project_auto_retry_limit" {
  description = "(Optional) Specify a maximum number of additional automatic retries after a failed build. The default is 0"
  type        = number
  default     = null
}
variable "codebuild_project_badge_enabled" {
  description = "(Optional) Generates a publicly-accessible URL for the projects build badge. Available as badge_url attribute when enabled."
  type        = bool
  default     = null
}
variable "codebuild_project_build_timeout" {
  description = "(Optional) Number of minutes, from 5 to 2160 (36 hours), for AWS CodeBuild to wait until timing out any related build that does not get marked as completed. The default is 60 minutes. The build_timeout property is not available on the Lambda compute type"
  type        = number
  default     = null
}
variable "codebuild_project_concurrent_build_limit" {
  description = "(Optional) Specify a maximum number of concurrent builds for the project. The value specified must be greater than 0 and less than the account concurrent running builds limit"
  type        = number
  default     = null
}
variable "codebuild_project_description" {
  description = "(Optional) Short description of the project"
  type        = string
  default     = null
}
variable "codebuild_project_encryption_key" {
  description = "(Optional) KMS customer master key (CMK) to be used for encrypting the build project's build output artifacts"
  type        = string
  default     = null
}
variable "codebuild_project_name" {
  description = "(Required) Project's name"
  type        = string
}
variable "codebuild_project_project_visibility" {
  description = "(Optional) Specifies the visibility of the project's builds. Possible values are: PUBLIC_READ and PRIVATE. Default value is PR
IVATE"
  type        = string
  default     = null
}
variable "codebuild_project_resource_access_role" {
  description = "(Optional) The ARN of the IAM role that enables CodeBuild to access the CloudWatch Logs and Amazon S3 artifacts for the projec
t's builds in order to display them publicly. Only applicable if project_visibility is PUBLIC_READ"
  type        = string
  default     = null
}
variable "codebuild_project_queued_timeout" {
  description = "(Optional) Number of minutes, from 5 to 480 (8 hours), a build is allowed to be queued before it times out. The default is 8 h
ours. The queued_timeout property is not available on the Lambda compute type"
  type        = number
  default     = null
}
variable "codebuild_project_service_role" {
  description = "(Required) ARN of the AWS Identity and Access Management (IAM) role that enables AWS CodeBuild to interact with dependent AWS
services on behalf of the AWS account"
  type        = string
}
variable "codebuild_project_source_version" {
  description = "(Optional) Version of the build input to be built for this project. If not specified, the latest version is used"
  type        = string
  default     = null
}
variable "codebuild_project_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "codebuild_project_artifacts" {
  description = "(Required) Configuration block"
  type        = list(object({
    artifact_identifier    = optional(string)
    bucket_owner_access    = optional(string)
    encryption_disabled    = optional(bool)
    location               = optional(string)
    name                   = optional(string)
    namespace_type         = optional(string)
    override_artifact_name = optional(bool)
    packaging              = optional(string)
    path                   = optional(string)
    type                   = string
  }))
}
variable "codebuild_project_build_batch_config" {
  description = "(Optional) Defines the batch build options for the project"
  type        = list(object({
    combine_artifacts = optional(bool)
    service_role      = string
    timeout_in_mins   = optional(number)
    restrictions      = optional(list(object({
      compute_types_allowed  = optional(list(string))
      maximum_builds_allowed = optional(number)
    })), [])
  }))
  default     = []
}
variable "codebuild_project_cache" {
  description = "(Optional) Configuration block"
  type        = list(object({
    cache_namespace = optional(string)
    location        = string
    modes           = string
    type            = optional(string)
  }))
  default     = []
}
variable "codebuild_project_environment" {
  description = "(Required) Configuration block"
  type        = list(object({
    certificate                 = optional(string)
    compute_type                = string
    host_kernel                 = optional(string)
    image_pull_credentials_type = optional(string)
    image                       = string
    privileged_mode             = optional(bool)
    type                        = string
    docker_server               = optional(list(object({
      compute_type       = string
      security_group_ids = list(string)
    })), [])
    fleet                       = optional(list(object({
      fleet_arn = optional(string)
    })), [])
    environment_variable        = optional(list(object({
      name  = string
      type  = optional(string)
      value = string
    })), [])
    registry_credential         = optional(list(object({
      credential          = string
      credential_provider = string
    })), [])
  }))
}
variable "codebuild_project_file_system_locations" {
  description = "(Optional) A set of file system locations to mount inside the build"
  type        = list(object({
    identifier    = optional(string)
    location      = optional(string)
    mount_options = optional(string)
    mount_point   = optional(string)
    type          = optional(string)
  }))
  default = []
}
variable "codebuild_project_logs_config" {
  description = "(Optional) Configuration block"
  type        = list(object({
    cloudwatch_logs = optional(list(object({
      group_name  = optional(string)
      status      = optional(string)
      stream_name = optional(string)
    })), [])
    s3_logs         = optional(list(object({
      encryption_disabled = optional(bool)
      location            = optional(string)
      status              = optional(string)
      bucket_owner_access = optional(string)
    })), [])
  }))
  default = []
}
variable "codebuild_project_secondary_artifacts" {
  description = "(Optional) Configuration block"
  type        = list(object({
    artifact_identifier    = string
    bucket_owner_access    = optional(string)
    encryption_disabled    = optiona(bool)
    location               = optional(string)
    name                   = optional(string)
    namespace_type         = optional(string)
    override_artifact_name = optional(string)
    packaging              = optional(string)
    path                   = optional(string)
    type                   = string
  }))
  default     = []
}
variable "codebuild_project_secondary_sources" {
  description = "(Optional) Configuration block"
  type        = list(object({
    buildspec             = optional(string)
    git_clone_depth       = optional(number)
    insecure_ssl          = optional(bool)
    location              = optional(string)
    report_build_status   = optional(bool)
    build_status_config   = optional(bool)
    source_identifier     = string
    type                  = string
    auth                  = optional(list(object({
      type     = string
      resource = string
    })), [])
    git_submodules_config = optional(list(object({
      fetch_submodules = bool
    })), [])
    build_status_config   = optional(list(object({
      context    = optional(string)
      target_url = optional(string)
    })), [])
  }))
  default     = []
}
variable "codebuild_project_secondary_source_version" {
  description = "(Optional) Configuration block"
  type        = list(object({
    source_identifier = string
    source_version    = string
  }))
  default     = []
}
variable "codebuild_project_source" {
  description = "(Required) Configuration block"
  type        = list(object({
    buildspec           = optional(string)
    git_clone_depth     = optional(number)
    insecure_ssl        = optional(bool)
    location            = optional(string)
    report_build_status = optional(bool)
    type                = string
    auth                  = optional(list(object({
      type     = string
      resource = string
    })), [])
    git_submodules_config = optional(list(object({
      fetch_submodules = bool
    })), [])
    build_status_config   = optional(list(object({
      context    = optional(string)
      target_url = optional(string)
    })), [])
  }))
}
variable "codebuild_project_vpc_config" {
  description = "(Optional) Configuration block"
  type        = list(object({
    security_group_ids = list(string)
    subnets            = list(string)
    vpc_id             = string
  }))
  default     = []
}
