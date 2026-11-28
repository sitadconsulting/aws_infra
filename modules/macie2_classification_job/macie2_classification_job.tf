resource "aws_macie2_classification_job" "macie2_classification_job" {
  custom_data_identifier_ids = var.macie2_classification_job_custom_data_identifier_ids
  description                = var.macie2_classification_job_description
  initial_run                = var.macie2_classification_job_initial_run
  job_status                 = var.macie2_classification_job_job_status
  job_type                   = var.macie2_classification_job_job_type
  name                       = var.macie2_classification_job_name
  name_prefix                = var.macie2_classification_job_name_prefix
  sampling_percentage        = var.macie2_classification_job_sampling_percentage
  tags                       = var.macie2_classification_job_tags

  dynamic "s3_job_definition" {
    for_each = var.macie2_classification_job_s3_job_definition
      content {
        dynamic "bucket_criteria" {
          for_each = s3_job_definition.value.bucket_criteria
            content {
              dynamic "excludes" {
                for_each = bucket_criteria.value.excludes
                  content {
                    dynamic "and" {
                      for_each = excludes.value.and
                        content {
                          dynamic "simple_criterion" {
                            for_each = and.value.simple_criterion
                              content {
                                comparator = simple_criterion.value["comparator"]
                                key        = simple_criterion.value["key"]
                                values     = simple_criterion.value["values"]
                              }
                          }
                          dynamic "tag_criterion" {
                            for_each = and.value.tag_criterion
                              content {
                                comparator = tag_criterion.value["comparator"]
                                dynamic "tag_values" {
                                  for_each = tag_criterion.value.tag_values
                                    content {
                                      key   = tag_values.value["key"]
                                      value = tag_values.value["value"]
                                    }
                                }
                              }
                          }
                        }
                    }
                  }
              }
              dynamic "includes" {
                for_each = bucket_criteria.value.includes
                  content {
                    dynamic "and" {
                      for_each = includes.value.and
                        content {
                          dynamic "simple_criterion" {
                            for_each = and.value.simple_criterion
                              content {
                                comparator = simple_criterion.value["comparator"]
                                key        = simple_criterion.value["key"]
                                values     = simple_criterion.value["values"]
                              }
                          }
                          dynamic "tag_criterion" {
                            for_each = and.value.tag_criterion
                              content {
                                comparator = tag_criterion.value["comparator"]
                                dynamic "tag_values" {
                                  for_each = tag_criterion.value.tag_values
                                    content {
                                      key   = tag_values.value["key"]
                                      value = tag_values.value["value"]
                                    }
                                }
                              }
                          }
                        }
                    }
                  }
              }
            }
        }
        dynamic "bucket_definitions" {
          for_each = s3_job_definition.value.bucket_definitions
            content {
              account_id = bucket_definitions.value["account_id"]
              buckets    = bucket_definitions.value["buckets"]
            }
        }
        dynamic "scoping" {
          for_each = s3_job_definition.value.scoping
            content {
              dynamic "excludes" {
                for_each = scoping.value.excludes
                  content {
                    dynamic "and" {
                      for_each = excludes.value.and
                        content {
                          dynamic "simple_scope_term" {
                            for_each = and.value.simple_scope_term
                              content {
                                comparator = simple_scope_term.value["comparator"]
                                key        = simple_scope_term.value["key"]
                                values     = simple_scope_term.value["values"]
                              }
                          }
                          dynamic "tag_scope_term" {
                            for_each = and.value.tag_scope_term
                              content {
                                comparator = tag_scope_term.value["comparator"]
                                key        = tag_scope_term.value["key"]
                                target     = tag_scope_term.value["target"]
                                dynamic "tag_values" {
                                  for_each = tag_scope_term.value.tag_values
                                    content {
                                      key   = tag_values.value["key"]
                                      value = tag_values.value["value"]
                                    }
                                }
                              }
                          }
                        }
                    }
                  }
              }
              dynamic "includes" {
                for_each = scoping.value.includes
                  content {
                    dynamic "and" {
                      for_each = includes.value.and
                        content {
                          dynamic "simple_scope_term" {
                            for_each = and.value.simple_scope_term
                              content {
                                comparator = simple_scope_term.value["comparator"]
                                key        = simple_scope_term.value["key"]
                                values     = simple_scope_term.value["values"]
                              }
                          }
                          dynamic "tag_scope_term" {
                            for_each = and.value.tag_scope_term
                              content {
                                comparator = tag_scope_term.value["comparator"]
                                key        = tag_scope_term.value["key"]
                                target     = tag_scope_term.value["target"]
                                dynamic "tag_values" {
                                  for_each = tag_scope_term.value.tag_values
                                    content {
                                      key   = tag_values.value["key"]
                                      value = tag_values.value["value"]
                                    }
                                }
                              }
                          }
                        }
                    }
                  }
              }
            }
        }
      }
  }
  dynamic "schedule_frequency" {
    for_each = var.macie2_classification_job_schedule_frequency
      content {
        daily_schedule   = schedule_frequency.value["daily_schedule"]
        monthly_schedule = schedule_frequency.value["monthly_schedule"]
        weekly_schedule  = schedule_frequency.value["weekly_schedule"]
      }
  }
}
