resource "aws_codebuild_project" "codebuild_project" {
  auto_retry_limit       = var.codebuild_project_auto_retry_limit
  badge_enabled          = var.codebuild_project_badge_enabled
  build_timeout          = var.codebuild_project_build_timeout
  concurrent_build_limit = var.codebuild_project_concurrent_build_limit
  description            = var.codebuild_project_description
  encryption_key         = var.codebuild_project_encryption_key
  name                   = var.codebuild_project_name
  project_visibility     = var.codebuild_project_project_visibility
  resource_access_role   = var.codebuild_project_resource_access_role
  queued_timeout         = var.codebuild_project_queued_timeout
  service_role           = var.codebuild_project_service_role
  source_version         = var.codebuild_project_source_version
  tags                   = var.codebuild_project_tags

  dynamic "artifacts" {
    for_each = var.codebuild_project_artifacts
      content {
        artifact_identifier    = artifacts.value["artifact_identifier"]
        bucket_owner_access    = artifacts.value["bucket_owner_access"]
        encryption_disabled    = artifacts.value["encryption_disabled"]
        location               = artifacts.value["location"]
        name                   = artifacts.value["name"]
        namespace_type         = artifacts.value["namespace_type"]
        override_artifact_name = artifacts.value["override_artifact_name"]
        packaging              = artifacts.value["packaging"]
        path                   = artifacts.value["path"]
        type                   = artifacts.value["type"]
      }
  }
  dynamic "build_batch_config" {
    for_each = var.codebuild_project_build_batch_config
      content {
        combine_artifacts = build_batch_config.value["combine_artifacts"]
        service_role      = build_batch_config.value["service_role"]
        timeout_in_mins   = build_batch_config.value["timeout_in_mins"]
        dynamic "restrictions" {
          for_each = build_batch_config.value.restrictions
            content {
              compute_types_allowed  = restrictions.value["compute_types_allowed"]
              maximum_builds_allowed = restrictions.value["maximum_builds_allowed"]
            }
        }
      }
  }
  dynamic "cache" {
    for_each = var.codebuild_project_cache
      content {
        cache_namespace = cache.value["cache_namespace"]
        location        = cache.value["location"]
        modes           = cache.value["modes"]
        type            = cache.value["type"]
      }
  }
  dynamic "environment" {
    for_each = var.codebuild_project_environment
      content {
        certificate                 = environment.value["certificate"]
        compute_type                = environment.value["compute_type"]
        host_kernel                 = environment.value["host_kernel"]
        image_pull_credentials_type = environment.value["image_pull_credentials_type"]
        image                       = environment.value["image"]
        privileged_mode             = environment.value["privileged_mode"]
        type                        = environment.value["type"]

        dynamic "docker_server" {
          for_each = environment.value.docker_server
            content {
              compute_type       = docker_server.value["compute_type"]
              security_group_ids = docker_server.value["security_group_ids"]
            }
        }
        dynamic "fleet" {
          for_each = environment.value.fleet
            content {
              fleet_arn = fleet.value["fleet_arn"]
            }
        }
        dynamic "environment_variable" {
          for_each = environment.value.environment_variable
            content {
              name  = environment_variable.value["name"]
              type  = environment_variable.value["type"]
              value = environment_variable.value["value"]
            }
        }
       dynamic "registry_credential" {
          for_each = environment.value.registry_credential
            content {
              credential          = registry_credential.value["credential"]
              credential_provider = registry_credential.value["credential_provider"]
            }
        }
      }
  }
  dynamic "file_system_locations" {
    for_each = var.codebuild_project_file_system_locations
      content {
        identifier    = file_system_locations.value["identifier"]
        location      = file_system_locations.value["location"]
        mount_options = file_system_locations.value["mount_options"]
        mount_point   = file_system_locations.value["mount_point"]
        type          = file_system_locations.value["type"]
      }
  }
  dynamic "logs_config" {
    for_each = var.codebuild_project_logs_config
      content {
        dynamic "cloudwatch_logs" {
          for_each = logs_config.value.cloudwatch_logs
            content {
              group_name  = cloudwatch_logs.value["group_name"]
              status      = cloudwatch_logs.value["status"]
              stream_name = cloudwatch_logs.value["stream_name"]
            }
        }
        dynamic "s3_logs" {
          for_each = logs_config.value.s3_logs
            content {
              encryption_disabled = s3_logs.value["encryption_disabled"]
              location            = s3_logs.value["location"]
              status              = s3_logs.value["status"]
              bucket_owner_access = s3_logs.value["bucket_owner_access"]
            }
        }
      }
  }
  dynamic "secondary_artifacts" {
    for_each = var.codebuild_project_secondary_artifacts
      content {
        artifact_identifier    = secondary_artifacts.value["artifact_identifier"]
        bucket_owner_access    = secondary_artifacts.value["bucket_owner_access"]
        encryption_disabled    = secondary_artifacts.value["encryption_disabled"]
        location               = secondary_artifacts.value["location"]
        name                   = secondary_artifacts.value["name"]
        namespace_type         = secondary_artifacts.value["namespace_type"]
        override_artifact_name = secondary_artifacts.value["override_artifact_name"]
        packaging              = secondary_artifacts.value["packaging"]
        path                   = secondary_artifacts.value["path"]
        type                   = secondary_artifacts.value["type"]
      }
  }
  dynamic "secondary_sources" {
    for_each = var.codebuild_project_secondary_sources
      content {
        buildspec             = secondary_sources.value["buildspec"]
        git_clone_depth       = secondary_sources.value["git_clone_depth"]
        insecure_ssl          = secondary_sources.value["insecure_ssl"]
        location              = secondary_sources.value["location"]
        report_build_status   = secondary_sources.value["report_build_status"]
        build_status_config   = secondary_sources.value["build_status_config"]
        source_identifier     = secondary_sources.value["source_identifier"]
        type                  = secondary_sources.value["type"]
        dynamic "auth" {
          for_each = secondary_sources.value.auth
            content {
              type     = auth.value["type"]
              resource = auth.value["resource"]
            }
        }
        dynamic "git_submodules_config" {
          for_each = secondary_sources.value.git_submodules_config
            content {
              fetch_submodules = git_submodules_config.value["fetch_submodules"]
            }
        }
        dynamic "build_status_config" {
          for_each = secondary_sources.value.build_status_config
            content {
              context    = build_status_config.value["context"]
              target_url = build_status_config.value["target_url"]
            }
        }
      }
  }
  dynamic "secondary_source_version" {
    for_each = var.codebuild_project_secondary_source_version
      content {
        source_identifier = secondary_source_version.value["source_identifier"]
        source_version    = secondary_source_version.value["source_version"]
      }
  }
  dynamic "source" {
    for_each = var.codebuild_project_source
      content {
        buildspec           = source.value["buildspec"]
        git_clone_depth     = source.value["git_clone_depth"]
        insecure_ssl        = source.value["insecure_ssl"]
        location            = source.value["location"]
        report_build_status = source.value["report_build_status"]
        type                = source.value["type"]
        dynamic "auth" {
          for_each = source.value.auth
            content {
              type     = auth.value["type"]
              resource = auth.value["resource"]
            }
        }
        dynamic "git_submodules_config" {
          for_each = source.value.git_submodules_config
            content {
              fetch_submodules = git_submodules_config.value["fetch_submodules"]
            }
        }
        dynamic "build_status_config" {
          for_each = source.value.build_status_config
            content {
              context    = build_status_config.value["context"]
              target_url = build_status_config.value["target_url"]
            }
        }
      }
  }
  dynamic "vpc_config" {
    for_each = var.codebuild_project_vpc_config
      content {
        security_group_ids = vpc_config.value["security_group_ids"]
        subnets            = vpc_config.value["subnets"]
        vpc_id             = vpc_config.value["vpc_id"]
      }
  }
}

