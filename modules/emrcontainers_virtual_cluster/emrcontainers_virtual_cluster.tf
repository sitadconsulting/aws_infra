resource "aws_emrcontainers_virtual_cluster" "emrcontainers_virtual_cluster" {
  name = var.emrcontainers_virtual_cluster_name
  tags = var.emrcontainers_virtual_cluster_tags

  dynamic "container_provider" {
    for_each = var.emrcontainers_virtual_cluster_container_provider
      content {
        id   = container_provider.value["id"]
        type = container_provider.value["type"]
        dynamic "info" {
          for_each = container_provider.value.info
            content {
              dynamic "eks_info" {
                for_each = infa.value.eks_info
                  content {
                    namespace = eks_info.value["namespace"]
                  }
              } 
            }
        }
      }
  }
}
