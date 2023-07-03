resource "aws_msk_serverless_cluster" "msk_serverless_cluster" {
  cluster_name = var.msk_serverless_cluster_cluster_name
  tags         = var.msk_serverless_cluster_tags

  dynamic "client_authentication" {
    for_each = var.msk_serverless_cluster_client_authentication
      content {
        dynamic "sasl" {
          for_each = client_authentication.value.sasl
            content {
              dynamic "iam" {
                for_each = sasl.value.iam
                  content {
                    enabled = iam.value["enabled"]
                  }
              }
            }
        }
      }
  }  
  dynamic "vpc_config" {
    for_each = var.msk_serverless_cluster_vpc_config
      content {
        security_group_ids = vpc_config.value["security_group_ids"]
        subnet_ids         = vpc_config.value["subnet_ids"]
      }
  }
}
