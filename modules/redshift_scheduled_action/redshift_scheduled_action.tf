resource "aws_redshift_scheduled_action" "redshift_scheduled_action" {
  description = var.redshift_scheduled_action_description
  enabled     = var.redshift_scheduled_action_enabled
  end_time    = var.redshift_scheduled_action_end_time
  name        = var.redshift_scheduled_action_name
  iam_role    = var.redshift_scheduled_action_iam_role
  schedule    = var.redshift_scheduled_action_schedule
  start_time  = var.redshift_scheduled_action_start_time

  dynamic "target_action" {
    for_each = var.redshift_scheduled_action_target_action
      content {
        dynamic "pause_cluster" {
          for_each = target_action.value.pause_cluster
            content {
               cluster_identifier = pause_cluster.value["cluster_identifier"]
            }
         }
         dynamic "resize_cluster" {
           for_each = target_action.value.resize_cluster
             content {
               classic            = resize_cluster.value["classic"]
               cluster_identifier = resize_cluster.value["cluster_identifier"]
               cluster_type       = resize_cluster.value["cluster_type"]
               node_type          = resize_cluster.value["node_type"]
               number_of_nodes    = resize_cluster.value["number_of_nodes"]
             }
         }
         dynamic "resume_cluster" {
           for_each = target_action.value.resume_cluster
             content {
               cluster_identifier = resume_cluster.value["cluster_identifier"]
             }
         }
      }
  }
}
