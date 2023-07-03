provider "kubernetes" {
 #host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  config_path            = "~/.kube/config"
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", module.eks_cluster["dev_cluster"].eks_cluster_name]
    command     = "aws"
  }
}
provider "helm" {
  kubernetes {
    #host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    config_path            = "~/.kube/config"
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", module.eks_cluster["dev_cluster"].eks_cluster_name]
      command     = "aws"
    }
  }
  #experiments {
  #  manifest = true
  #}
}

locals {

  kube_config_map_props = {
    config_map = {
      metadata           = [
        {
           name      = "aws-auth"
           namespace = "kube-system"
        },
      ]
      data                = {
        mapRoles           = data.template_file.auth_config_mapRoles.rendered
        mapUsers           = data.template_file.auth_config_mapUsers.rendered
      }
    }   
  }
  nginx_config_map_props = {
    config_map = {
      metadata           = [
        {
           name      = "nginx-config"
           namespace = "eks-sample-app"
        },
      ]
      data                = {
        "index.html"      = data.template_file.nginx_config_map.rendered
      }
    }   
  }
  kube_namespace_props = {
    app_ns = {
      name        = "eks-sample-app"
    },
    cert_manager_ns = {
      name        = "cert-manager"
    },
    aws_privateca_issuer_ns = {
      name        = "aws-privateca-issuer"
    },
    awsgatewayapi_ns = {
      name        = "aws-application-networking-system"
    }
    awsgatewayapi_ingress_ns = {
      name        = "aws-gatewayapi-ingress"
    }
  }
  kube_secret_props = {
    aws_lbc_sa_secret = {
      metadata_annotations = {
        "kubernetes.io/service-account.name" = "aws-load-balancer-controller"
      }
      metadata_labels = {
        "app.kubernetes.io/name"         = "aws-load-balancer-controller"
        "app.kubernetes.io/managed-by"   = "terraform"
      }
      metadata_name       = "aws-load-balancer-controller-sa-secret"
      metadata_namespace  = "kube-system"
     
      type                = "kubernetes.io/service-account-token"
    }
    nginx_db_secret_sa_secret = {
      metadata_annotations = {
        "kubernetes.io/service-account.name" = "secrets-store-csi-driver"
      }
      metadata_labels = {
        "app.kubernetes.io/name"         = "nginx-db-secret"
        "app.kubernetes.io/managed-by"   = "terraform"
      }
      metadata_name       = "nginx-db-secret-sa-secret"
      metadata_namespace  = "kube-system"
     
      type                = "kubernetes.io/service-account-token"
    }
  }
  kube_annotations = {
    ebs_csi_driver_annotation = {
      api_version        = "v1"
      kind               = "ServiceAccount"
      metadata           = [
        {
           name      = "ebs-csi-controller-sa"
           namespace = "kube-system"
        },
      ]
      annotations        = {
        "eks.amazonaws.com/role-arn"  = module.eks_ebs_csi_driver_iam_role["ebs_csi_driver_iam_role"].iam_role_arn
      }
    }
    aws_secrets_manager_annotation = {
      api_version        = "v1"
      kind               = "ServiceAccount"
      metadata           = [
        {
           name      = "secrets-store-csi-driver-provider-aws"
           namespace = "eks-sample-app"
        },
      ]
      annotations        = {
        "eks.amazonaws.com/role-arn"  = module.nginx_db_secret_iam_role["nginx_db_secret_iam_role"].iam_role_arn
      }
    }
    default_sa = {
      api_version        = "v1"
      kind               = "ServiceAccount"
      metadata           = [
        {
           name      = "default"
           namespace = "eks-sample-app"
        },
      ]
      annotations        = {
        "eks.amazonaws.com/role-arn"  = module.nginx_db_secret_iam_role["nginx_db_secret_iam_role"].iam_role_arn
      }
    }
    aws_privateca_issuer_annotation = {
      api_version        = "v1"
      kind               = "ServiceAccount"
      metadata           = [
        {
           name      = "aws-privateca-issuer"
           namespace = "eks-sample-app"
        },
      ]
      annotations        = {
        #"eks.amazonaws.com/role-arn"  = module.awspca_iam_role["awspca_iam_role"].iam_role_arn
        "eks.amazonaws.com/role-arn"  = module.eks_node_group_iam_role["eks_node_group_iam_role"].iam_role_arn
      }
    }
  }
  kube_service_account_props = {
    aws_lbc_sa = {
      metadata_annotations = {
        "eks.amazonaws.com/role-arn"                = module.eks_lb_controller_iam_role["eks_lb_controller_iam_role"].iam_role_arn
        "eks.amazonaws.com/sts-regional-endpoints"  = true
      }
      metadata_labels = {
        "app.kubernetes.io/name"         = "aws-load-balancer-controller"
        "app.kubernetes.io/component"    = "controller"
        "app.kubernetes.io/managed-by"   = "terraform"
      }
      metadata_name       = "aws-load-balancer-controller"
      metadata_namespace  = "kube-system"
    }
  }
  helm_package_props = {
    aws_lbc = {
      name        = "aws-load-balancer-controller"
      chart       = "aws-load-balancer-controller"
      repository  = "https://aws.github.io/eks-charts"
      namespace   = "kube-system"
      set = [
        {
          name  = "region"
          value = data.aws_region.current.name
        },
        #{
        #  name  = "image.tag"
        #  value = "v2.5.2"
        #},
        {
          name  = "vpcId"
          value = module.vpc["main_vpc"].vpc_id
        },
        {
          name  = "serviceAccount.create"
          value = "false"
        },
        {
          name  = "serviceAccount.name"
          value = "aws-load-balancer-controller"
        },
        {
          name  = "clusterName"
          value = module.eks_cluster["dev_cluster"].eks_cluster_name
        }
      ]
    }
    ebs_csi_controller = {
      name       = "aws-ebs-csi-driver"
      chart      = "aws-ebs-csi-driver"
      repository = "https://kubernetes-sigs.github.io/aws-ebs-csi-driver"
      namespace  = "kube-system"
      set = [
        {
          name  = "region"
          value = data.aws_region.current.name
        },
        {
          name  = "vpcId"
          value = module.vpc["main_vpc"].vpc_id
        },
        {
          name  = "serviceAccount.name"
          value = "ebs-csi-controller-sa"
        },
        {
          name  = "clusterName"
          value = module.eks_cluster["dev_cluster"].eks_cluster_name
        }
      ] 
    }
    cert_manager = {
      name       = "cert-manager"
      chart      = "cert-manager"
      repository = "https://charts.jetstack.io"
      namespace  = "cert-manager"
      set = [
        {
          name  = "region"
          value = data.aws_region.current.name
        },
        {
          name  = "vpcId"
          value = module.vpc["main_vpc"].vpc_id
        },
        {
          name  = "installCRDs"
          value = "true"
        },
        {
          name  = "clusterName"
          value = module.eks_cluster["dev_cluster"].eks_cluster_name
        },
      ] 
    }
    csi_secrets_store = {
      name       = "secrets-store-csi-driver"
      chart      = "secrets-store-csi-driver"
      repository = "https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts"
      namespace  = "kube-system"
      set = [
        {
          name  = "region"
          value = data.aws_region.current.name
        },
        {
          name  = "vpcId"
          value = module.vpc["main_vpc"].vpc_id
        },
        {
          name  = "clusterName"
          value = module.eks_cluster["dev_cluster"].eks_cluster_name
        },
        {
          name  = "syncSecret.enabled"
          value = "true"
        },
        {
          name  = "enableSecretRotation"
          value = "true"
        },
      ]
    }
    aws-secrets-manager = {
      name       = "secrets-store-csi-driver-provider-aws"
      chart      = "secrets-store-csi-driver-provider-aws"
      repository = "https://aws.github.io/secrets-store-csi-driver-provider-aws"
      namespace  = "eks-sample-app"
      set = [
        {
          name  = "region"
          value = data.aws_region.current.name
        },
        {
          name  = "vpcId"
          value = module.vpc["main_vpc"].vpc_id
        },
        {
          name  = "clusterName"
          value = module.eks_cluster["dev_cluster"].eks_cluster_name
        },
      ]
    }
    aws-privateca-issuer = {
      name       = "aws-privateca-issuer"
      chart      = "aws-privateca-issuer"
      repository = "https://cert-manager.github.io/aws-privateca-issuer"
      namespace  = "eks-sample-app"
      set = [
        {
          name  = "region"
          value = data.aws_region.current.name
        },
        {
          name  = "vpcId"
          value = module.vpc["main_vpc"].vpc_id
        },
        {
          name  = "clusterName"
          value = module.eks_cluster["dev_cluster"].eks_cluster_name
        },
      ]
    }
  }
  kube_deployment_props = {
    app_deployment = {
      metadata_labels  = {
        "app.kubernetes.io/name"       = "eks-sample-linux-app"
        "app.kubernetes.io/version"    = "v1.0"
        "app.kubernetes.io/managed-by" = "terraform"
       }
       metadata_name       = "eks-sample-linux-deployment"
       metadata_namespace  = "eks-sample-app"
       spec_replicas       = "2"
       
       spec_selector = {
         label_selector = {
             match_labels = {
               "app.kubernetes.io/name" = "eks-sample-linux-app"
             }
         },
       }
       spec_strategy = {
         rollout_strategy = {
           type     = "RollingUpdate"
           rolling_update = {
              update_behaviour = {
                max_surge       = "25%"
                max_unavailable = "25%"
              }
           }
         }
       }
       template_metadata_name = "eks-sample-linux-deployment"
       template_metadata_labels = {
         "app.kubernetes.io/name"    = "eks-sample-linux-app"
         "app.kubernetes.io/version" = "v1.0" 
       }
       node_selector = {
          "kubernetes.io/os" = "linux"
       }
       restart_policy                        = "Always"
       service_account_name                  = "default"
       node_affinity_required_match_expressions = [
         {
            key      = "kubernetes.io/os"
            operator = "In"
            values   = [ "linux", ]
         },
       ] 
       template_spec_volume = [
         {
           name                    = "nginx-data"
           persistent_volume_claim = [
             {
                claim_name = "ebs-standard-claim"
             },
           ]
         },
         {
           name        = "nginx-config"
           config_map  = [
             {
                name  = "nginx-config" 
             },
           ]
         },
         {
           name         = "nginx-db-secret"
             csi        = [
               {
                 driver            = "secrets-store.csi.k8s.io"
                 read_only         = true
                 volume_attributes = {
                   secretProviderClass = "nginx-db-secret-provider"
                 }
               },
             ]
         },
       ]
       template_spec_container = [
         {
           name              = "nginx"
           image             = "public.ecr.aws/nginx/nginx:1.21"
           image_pull_policy = "IfNotPresent"
           port              = [ 
             {
               name           = "http"
               container_port = 80
               protocol       = "TCP"
             }, 
           ] 
           volume_mount       = [
             {
               name       = "nginx-data"
               mount_path = "/usr/share/nginx"  
             },
             {
               name       = "nginx-config"
               mount_path = "/usr/share/nginx/html"
             },
             {
               name       = "nginx-db-secret"
               mount_path = "/mnt/secrets-store"
               read_only  = true
             },
           ]
         },
   
       ]
     }
  }
  kube_service_props = {
    app_service = {
        metadata_labels  = {
          "app.kubernetes.io/name"       = "eks-sample-linux-app"
          "app.kubernetes.io/version"    = "v1.0"
          "app.kubernetes.io/managed-by" = "terraform"
        }
        metadata_name       = "eks-sample-linux-service"
        metadata_namespace  = "eks-sample-app"
        session_affinity    = "ClientIP"
        type                = "NodePort"
        selector = {
          "app.kubernetes.io/name"  = "eks-sample-linux-app"
        }
        port    = [
          {
             port        = 80
             protocol    = "TCP"
             target_port = 80
          },
        ]
     }
   }
   kube_ingress_props = {
     app_ingress = {
       metadata_annotations = {
         "alb.ingress.kubernetes.io/target-type"  = "instance"
         "alb.ingress.kubernetes.io/scheme"       = "internet-facing"
         #"alb.ingress.kubernetes.io/listen-ports" = "[{\"HTTPS\" : 443}, {\"HTTPS\" : 80}]"
       }
       metadata_labels      = {
         "app.kubernetes.io/name"       = "eks-sample-linux-app"
         "app.kubernetes.io/version"    = "v1.0"
         "app.kubernetes.io/managed-by" = "terraform"
       }
       metadata_name         = "eks-sample-linux-ingress"
       metadata_namespace    = "eks-sample-app"
       ingress_class_name    = "alb"
       default_backend = [
         {
           service = [
             {
               name = "eks-sample-linux-service"
               port = [
                 {
                   number = 80
                 },
               ]
             },
           ]
         },
       ]
       rule  = [
         {
           #host = "k8s-ekssampl-ekssampl-6a90e9bd72-223802714.us-east-1.elb.amazonaws.com"
           http = [
             {
               path = [
                 {
                   path      = "/"
                   path_type = "Prefix"
                   backend   = [
                     {
                        service = [
                          {
                            name = "eks-sample-linux-service"
                            port = [
                              {
                                number = 80
                              },
                            ]
                          },
                        ],
                     },
                   ]
                 },
               ]
             },
           ]
         },
       ]
       #tls    = [
       #  {
       #     hosts        =  [
       #       "k8s-ekssampl-ekssampl-6a90e9bd72-223802714.us-east-1.elb.amazonaws.com"
       #     ]
       #     secret_name = "sitadconsulting-com-tls-cert"
       #  },
       #]
     }
   }
}
