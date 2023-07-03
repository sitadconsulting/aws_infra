resource "kubernetes_ingress_v1" "ingress" {

  metadata {
    annotations = var.ingress_metadata_annotations 
    labels      = var.ingress_metadata_labels
    name        = var.ingress_metadata_name
    namespace   = var.ingress_metadata_namespace
  }
  spec {
    ingress_class_name = var.ingress_spec_ingress_class_name
    dynamic "default_backend" {
      for_each = var.ingress_spec_default_backend
        content {
          dynamic "resource" {
            for_each = default_backend.value.resource
              content {
                api_group = resource.value["api_group"]
                kind      = resource.value["kind"]
                name      = resource.value["name"]
              }
          }
          dynamic "service" {
            for_each = default_backend.value.service
              content {
                name = service.value["name"]
                dynamic "port" {
                  for_each = service.value.port
                    content {
                      name   = port.value["name"]
                      number = port.value["number"]
                    }
                }
              }
          }
          
        }
    }
    dynamic "rule" {
      for_each = var.ingress_spec_rule
        content {
          host = rule.value["host"]
          dynamic "http" {
            for_each = rule.value.http
              content {
                dynamic "path" {
                  for_each = http.value.path
                    content {
                      path      = path.value["path"]
                      path_type = path.value["path_type"]
                      dynamic "backend" {
                        for_each = path.value.backend
                          content {
                            dynamic "resource" {
                              for_each = backend.value.resource
                                content {
                                  api_group = resource.value["api_group"]
                                  kind      = resource.value["kind"]
                                  name      = resource.value["name"]
                                }  
                            }
                            dynamic "service" {
                              for_each = backend.value.service
                                content {
                                  name = service.value["name"]
                                  dynamic "port" {
                                    for_each = service.value.port
                                      content {
                                        name   = port.value["name"]
                                        number = port.value["number"] 
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
    dynamic "tls" {
      for_each = var.ingress_spec_tls
        content {
          hosts       = tls.value["hosts"]
          secret_name = tls.value["secret_name"]
        }
    } 
  }
}
