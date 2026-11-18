resource "aws_emr_instance_group" "emr_instance_group" {
  autoscaling_policy  = var.emr_instance_group_autoscaling_policy
  bid_price           = var.emr_instance_group_bid_price
  cluster_id          = var.emr_instance_group_cluster_id 
  configurations_json = var.emr_instance_group_configurations_json
  ebs_optimized       = var.emr_instance_group_ebs_optimized
  instance_type       = var.emr_instance_group_instance_type
  instance_count      = var.emr_instance_group_instance_count
  name                = var.emr_instance_group_name

  dynamic "ebs_config" {
    for_each = var.emr_instance_group_ebs_config
      content {
        iops                 = ebs_config.value["iops"]
        size                 = ebs_config.value["size"]
        type                 = ebs_config.value["type"]
        volumes_per_instance = ebs_config.value["volumes_per_instance"] 
      }
  }
}
