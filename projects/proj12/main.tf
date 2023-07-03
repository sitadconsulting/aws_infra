terraform {
  required_version = ">= 1.3.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.3.0"
    }
    local = {
      source = "hashicorp/local"
      version = "~> 2.3.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.21.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.9.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.9.1"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}
module "vpc" {

  source = "../../modules/vpc"

  for_each = local.vpc_props

  vpc_cidr_block            = each.value.cidr_block
  vpc_enable_dns_hostnames  = each.value.enable_dns_hostnames
  vpc_enable_dns_support    = each.value.enable_dns_support
  vpc_tags                  = each.value.tags
}
module "vpc_dhcp_options" {
  source = "../../modules/vpc_dhcp_options"

  for_each = local.dhcp_options_props

  vpc_dhcp_options_domain_name          = each.value.domain_name
  vpc_dhcp_options_domain_name_servers  = each.value.domain_name_servers
  vpc_dhcp_options_tags                 = each.value.tags
}
module "vpc_dhcp_options_assoc" {
  source = "../../modules/vpc_dhcp_options_assoc"

  for_each = local.dhcp_options_assoc_props

  dhcp_options_association_vpc_id          = each.value.vpc_id
  dhcp_options_association_dhcp_options_id = each.value.dhcp_options_id
}
module "internet_gateway" {
  source = "../../modules/internet_gateway"

  for_each = local.igw_props

  internet_gateway_vpc_id  = each.value.vpc_id
  internet_gateway_tags    = each.value.tags

  depends_on = [ 
    module.public_subnet,
  ]
}
module "eip" {
  source = "../../modules/eip"

  for_each = local.eip_props

  eip_vpc  = each.value.vpc
}
module "public_subnet" {
  source = "../../modules/subnet"

  for_each = local.vpc_public_subnet_props

  subnet_vpc_id                    = each.value["public"].vpc_id
  subnet_cidr_block                = each.value["public"].cidr_block
  subnet_availability_zone         = each.value["public"].availability_zone
  subnet_map_public_ip_on_launch   = each.value["public"].map_public_ip_on_launch
  subnet_tags                      = each.value["public"].tags
}
module "private_subnet" {
  source = "../../modules/subnet"

  for_each = local.vpc_private_subnet_props

  subnet_vpc_id                    = each.value["private"].vpc_id
  subnet_cidr_block                = each.value["private"].cidr_block
  subnet_availability_zone         = each.value["private"].availability_zone
  subnet_map_public_ip_on_launch   = each.value["private"].map_public_ip_on_launch
  subnet_tags                      = each.value["private"].tags
}
module "nat_gateway" {
  source = "../../modules/nat_gateway"
 
  for_each = local.ngw_props

  nat_gateway_allocation_id = each.value.allocation_id
  nat_gateway_subnet_id     = each.value.subnet_id

  depends_on = [
    module.private_subnet,
  ]
}
module "public_route_table" {
  source = "../../modules/route_table"

  for_each = local.route_table_props

  route_table_vpc_id = each.value["public"].vpc_id
}
module "private_route_table" {
  source = "../../modules/route_table"

  for_each = local.route_table_props

  route_table_vpc_id = each.value["private"].vpc_id
}
module "public_route_table_association" {
  source = "../../modules/route_table_association"

  for_each = local.route_table_assoc_props
 
  route_table_association_subnet_id        = each.value["public"].subnet_id
  route_table_association_route_table_id   = each.value["public"].route_table_id

}
module "private_route_table_association" {
  source = "../../modules/route_table_association"

  for_each = local.route_table_assoc_props

  route_table_association_subnet_id       = each.value["private"].subnet_id
  route_table_association_route_table_id  = each.value["private"].route_table_id

}
module "internet_gateway_route" {
  source = "../../modules/route"

  for_each =  local.route_props
 
  route_route_table_id         = each.value["public"].route_table_id
  route_gateway_id             = each.value["public"].gateway_id
  route_destination_cidr_block = each.value["public"].destination_cidr_block
  depends_on = [
    module.public_route_table,
  ]
}
module "nat_gateway_route" {
  source = "../../modules/route"

  for_each =  local.route_props
 
  route_route_table_id         = each.value["private"].route_table_id
  route_nat_gateway_id         = each.value["private"].nat_gateway_id
  route_destination_cidr_block = each.value["public"].destination_cidr_block
  depends_on = [
    module.private_route_table,
  ]
}
module "eks_cluster_iam_role" {
  source = "../../modules/iam_role"

  for_each = local.eks_cluster_iam_role_props

  iam_role_name               = each.value.name
  iam_role_description        = each.value.description
  iam_role_assume_role_policy = each.value.assume_role_policy
  iam_role_path               = each.value.path
  iam_role_tags               = each.value.tags
} 
module "eks_cluster_iam_policy_attachment" {
  source = "../../modules/iam_role_policy_attachment"

  for_each = local.eks_cluster_iam_policy_attachment_props

  iam_role_policy_attachment_role        = each.value.role
  iam_role_policy_attachment_policy_arn  = each.value.policy_arn
}
module "eks_cluster" {
  source = "../../modules/eks_cluster"

  for_each = local.eks_cluster_props

  eks_cluster_name                        = each.value.name
  eks_cluster_role_arn                    = each.value.role_arn
  eks_cluster_enabled_cluster_log_types   = each.value.enabled_cluster_log_types
  eks_cluster_vpc_config                  = each.value.vpc_config            
}
module "eks_node_group_iam_role" {
  source = "../../modules/iam_role"

  for_each = local.eks_node_group_iam_role_props

  iam_role_name               = each.value.name
  iam_role_description        = each.value.description
  iam_role_assume_role_policy = each.value.assume_role_policy
  iam_role_path               = each.value.path
  iam_role_tags               = each.value.tags
}
module "worker_node_policy_attachment" {
  source = "../../modules/iam_role_policy_attachment"

  for_each = local.eks_worker_node_policy_iam_policy_attachment_props

  iam_role_policy_attachment_role        = each.value.role
  iam_role_policy_attachment_policy_arn  = each.value.policy_arn
}
module "eks_cni_policy_attachment" {
  source = "../../modules/iam_role_policy_attachment"

  for_each = local.eks_cni_policy_iam_policy_attachment_props

  iam_role_policy_attachment_role         = each.value.role
  iam_role_policy_attachment_policy_arn   = each.value.policy_arn
}
module "ec2_container_policy_attachment" {
  source = "../../modules/iam_role_policy_attachment"

  for_each = local.eks_container_registry_iam_policy_attachment_props

  iam_role_policy_attachment_role         = each.value.role
  iam_role_policy_attachment_policy_arn   = each.value.policy_arn
}
module "iam_openid_connect_provider" {
  source = "../../modules/iam_openid_connect_provider"

  for_each = local.eks_oidc_provider_props
 
  iam_openid_connect_provider_client_id_list  = each.value.client_id_list
  iam_openid_connect_provider_thumbprint_list = each.value.thumbprint_list
  iam_openid_connect_provider_url             = each.value.url
}
module "local_file" {
  source = "../../modules/local_file"

  for_each = local.local_file_props

  file_content              = each.value.content
  file_filename             = each.value.filename
  file_directory_permission = each.value.directory_permission
  file_file_permission      = each.value.file_permission
}
module "key_pair" {
  source = "../../modules/key_pair"

  for_each = local.key_pair_props

  key_pair_key_name   = each.value.key_name
  key_pair_public_key = each.value.public_key
}
module "security_group" {
  source = "../../modules/security_group"

  for_each = local.security_group_props
    
  security_group_name         = each.value.name
  security_group_description  = each.value.description
  security_group_vpc_id       = each.value.vpc_id

  security_group_tags = {
    "kubernetes.io/cluster/${var.name}-eks_cluster-${var.environment}" = "shared"
  }
}
module "vpc_security_group_rule" {
  source = "../../modules/vpc_security_group_rule"

  for_each = local.security_group_rule_props

  security_group_rule_cidr_blocks              = each.value.cidr_blocks
  security_group_rule_description              = each.value.description
  security_group_rule_from_port                = each.value.from_port
  security_group_rule_protocol                 = each.value.protocol
  security_group_rule_security_group_id        = each.value.security_group_id
  security_group_rule_source_security_group_id = each.value.source_security_group_id
  security_group_rule_to_port                  = each.value.to_port
  security_group_rule_type                     = each.value.type
}
module "iam_instance_profile" {
  source = "../../modules/iam_instance_profile"

  for_each = local.iam_instance_profile_props

  iam_instance_profile_name = each.value.name
  iam_instance_profile_path = each.value.path
  iam_instance_profile_role = each.value.role
}
module "launch_template" {
  source = "../../modules/launch_template"

  for_each = local.launch_template_props

  launch_template_default_version          = each.value.default_version
  launch_template_description              = each.value.description
  launch_template_disable_api_stop         = each.value.disable_api_stop
  launch_template_disable_api_termination  = each.value.disable_api_termination
  launch_template_ebs_optimized            = each.value.ebs_optimized
  launch_template_image_id                 = each.value.image_id
  launch_template_instance_type            = each.value.instance_type
  launch_template_key_name                 = each.value.key_name
  launch_template_name                     = each.value.name
  launch_template_user_data                = each.value.user_data
  launch_template_block_device_mappings    = each.value.block_device_mappings
  launch_template_iam_instance_profile     = each.value.iam_instance_profile
  launch_template_metadata_options         = each.value.metadata_options
  launch_template_monitoring               = each.value.monitoring
  launch_template_network_interfaces       = each.value.network_interfaces

  depends_on = [ 
    module.key_pair,
  ]
}
module "autoscaling_group" {
  source = "../../modules/autoscaling_group"

  for_each = local.autoscaling_group_props

  autoscaling_group_default_instance_warmup   = each.value.default_instance_warmup
  autoscaling_group_desired_capacity          = each.value.desired_capacity
  autoscaling_group_name                      = each.value.name
  autoscaling_group_max_size                  = each.value.max_size
  autoscaling_group_min_size                  = each.value.min_size
  autoscaling_group_vpc_zone_identifier       = each.value.vpc_zone_identifier
  autoscaling_group_launch_template           = each.value.launch_template
  autoscaling_group_instance_refresh          = each.value.instance_refresh
  autoscaling_group_tag                       = each.value.autoscaling_group_tag
}
module "eks_lb_controller_iam_role" {
  source = "../../modules/iam_role"

  for_each = local.eks_lb_controller_iam_role_props

  iam_role_name               = each.value.name
  iam_role_description        = each.value.description
  iam_role_assume_role_policy = each.value.assume_role_policy
  iam_role_path               = each.value.path
  iam_role_tags               = each.value.tags
}
module "eks_lb_controller_iam_policy" {
  source = "../../modules/iam_policy"

   for_each = local.eks_lb_controller_iam_policy_props

   iam_policy_name        = each.value.name
   iam_policy_description = each.value.description
   iam_policy_policy      = each.value.policy
   iam_policy_path        = each.value.path
   iam_policy_tags        = each.value.tags
}
module "eks_lb_controller_iam_policy_attachment" {
  source = "../../modules/iam_role_policy_attachment"

  for_each = local.eks_lb_controller_iam_policy_attachment_props

  iam_role_policy_attachment_role        = each.value.role
  iam_role_policy_attachment_policy_arn  = each.value.policy_arn
}
module "eks_ebs_csi_driver_iam_role" {
  source = "../../modules/iam_role"

  for_each = local.eks_ebs_csi_driver_iam_role_props

  iam_role_name               = each.value.name
  iam_role_description        = each.value.description
  iam_role_assume_role_policy = each.value.assume_role_policy
  iam_role_path               = each.value.path
  iam_role_tags               = each.value.tags
}
module "eks_ebs_csi_driver_iam_policy_attachment" {
  source = "../../modules/iam_role_policy_attachment"

  for_each = local.eks_ebs_csi_driver_iam_policy_attachment_props

  iam_role_policy_attachment_role        = each.value.role
  iam_role_policy_attachment_policy_arn  = each.value.policy_arn
}
module "nginx_db_secret_iam_role" {
  source = "../../modules/iam_role"

  for_each = local.nginx_db_secret_iam_role_props

  iam_role_name               = each.value.name
  iam_role_description        = each.value.description
  iam_role_assume_role_policy = each.value.assume_role_policy
  iam_role_path               = each.value.path
  iam_role_tags               = each.value.tags
}
module "nginx_db_secret_iam_policy_attachment" {
  source = "../../modules/iam_role_policy_attachment"

  for_each = local.nginx_db_secret_iam_policy_attachment_props

  iam_role_policy_attachment_role        = each.value.role
  iam_role_policy_attachment_policy_arn  = each.value.policy_arn
}
module "iam_user" {
  source = "../../modules/iam_user"

  for_each = local.eks_iam_user_props

  iam_user_name           = each.value.name
  iam_user_path           = each.value.path
  iam_user_force_destroy  = each.value.force_destroy
}
module "iam_user_policy" {
  source = "../../modules/iam_policy"

  for_each = local.eks_iam_user_policy_props

  iam_policy_name        = each.value.name
  iam_policy_description = each.value.description
  iam_policy_policy      = each.value.policy
  iam_policy_path        = each.value.path
}
module "iam_user_policy_attachment" {
  source = "../../modules/iam_user_policy_attachment"

  for_each = local.eks_iam_user_policy_attachment_props

  iam_user_policy_attachment_user       = each.value.user
  iam_user_policy_attachment_policy_arn = each.value.policy_arn
}

module "iam_access_key" {
  source = "../../modules/iam_access_key"

  for_each = local.iam_access_key_props

  iam_access_key_pgp_key = each.value.pgp_key
  iam_access_key_status  = each.value.status
  iam_access_key_user    = each.value.user
}
module "iam_user_login_profile" {
  source = "../../modules/iam_user_login_profile"
  
  for_each = local.iam_user_login_profile_props

  iam_user_login_profile_user                    = each.value.user
  iam_user_login_profile_pgp_key                 = each.value.pgp_key
  iam_user_login_profile_password_length         = each.value.password_length
  iam_user_login_profile_password_reset_required = each.value.password_reset_required
}
module "secretsmanager_secret" {
  source = "../../modules/secretsmanager_secret"

  for_each = local.nginx_db_secret_props

  secret_description  = each.value.description
  secret_name         = each.value.name
  secret_tags         = each.value.tags
}
module "secretsmanager_secret_version" {
  source = "../../modules/secretsmanager_secret_version"

  for_each = local.nginx_db_secret_version_props

  secret_version_secret_id     = each.value.secret_id
  secret_version_secret_string = each.value.secret_string
}
module "awspca_iam_role" {
  source = "../../modules/iam_role"

  for_each = local.awspca_iam_role_props

  iam_role_name               = each.value.name
  iam_role_description        = each.value.description
  iam_role_assume_role_policy = each.value.assume_role_policy
  iam_role_path               = each.value.path
  iam_role_tags               = each.value.tags
}
module "awspca_iam_policy_attachment" {
  source = "../../modules/iam_role_policy_attachment"

  for_each = local.awspca_iam_policy_attachment_props

  iam_role_policy_attachment_role        = each.value.role
  iam_role_policy_attachment_policy_arn  = each.value.policy_arn
}
module "awsgatewayapi_iam_role" {
  source = "../../modules/iam_role"

  for_each = local.awsgatewayapi_iam_role_props

  iam_role_name               = each.value.name
  iam_role_description        = each.value.description
  iam_role_assume_role_policy = each.value.assume_role_policy
  iam_role_path               = each.value.path
  iam_role_tags               = each.value.tags
}
module "awsgatewayapi_iam_policy_attachment" {
  source = "../../modules/iam_role_policy_attachment"

  for_each = local.awsgatewayapi_iam_policy_attachment_props

  iam_role_policy_attachment_role        = each.value.role
  iam_role_policy_attachment_policy_arn  = each.value.policy_arn
}
module "acmpca_certificate" {
  source = "../../modules/acmpca_certificate"

  for_each = local.acmpca_certificate_props

  acmpca_certificate_certificate_authority_arn   = each.value.certificate_authority_arn
  acmpca_certificate_certificate_signing_request = each.value.certificate_signing_request
  acmpca_certificate_signing_algorithm           = each.value.signing_algorithm
  acmpca_certificate_template_arn                = each.value.template_arn
  acmpca_certificate_validity                    = each.value.validity
}
module "acmpca_ca" {
  source = "../../modules/acmpca_certificate_authority"

  for_each = local.acmpca_ca_props

  certificate_authority_usage_mode                          = each.value.usage_mode
  certificate_authority_tags                                = each.value.tags
  certificate_authority_type                                = each.value.type
  certificate_authority_certificate_authority_configuration = each.value.certificate_authority_configuration
  certificate_authority_revocation_configuration            = each.value.revocation_configuration
}
module "acmpca_ca_certificate" {
  source = "../../modules/acmpca_certificate_authority_certificate"

  for_each = local.acmpca_ca_certificate_props

  certificate_authority_certificate_certificate               = each.value.certificate
  certificate_authority_certificate_certificate_authority_arn = each.value.certificate_authority_arn
}
module "acmpca_permission" {
  source = "../../modules/acmpca_permission"

  for_each = local.acmpca_permission_props

  acmpca_permission_certificate_authority_arn = each.value.certificate_authority_arn
  acmpca_permission_actions                   = each.value.actions
  acmpca_permission_principal                 = each.value.principal
}
##############################
# Second Plan and Apply Cycle 
##############################
#module "kubernetes_config_map" {
#  source = "../../modules/kubernetes_config_map"
#
#  for_each = local.kube_config_map_props
# 
#  config_map_metadata            = each.value.metadata
#  config_map_data                = each.value.data
#}
#############################
# Third Plan and Apply Cycle 
#############################
#module "kubernetes_namespace" {
#  source = "../../modules/kubernetes_namespace"
#
#  for_each = local.kube_namespace_props
#
#  namespace_name  = each.value.name
#}
##############################
# Fourth Plan and Apply Cycle
##############################
#module "kubernetes_service_account" {
#  source = "../../modules/kubernetes_service_account"
# 
#  for_each = local.kube_service_account_props
#
#  service_account_metadata_annotations = each.value.metadata_annotations
#  service_account_metadata_labels      = each.value.metadata_labels
#  service_account_metadata_name        = each.value.metadata_name
#  service_account_metadata_namespace   = each.value.metadata_namespace
#}
#module "kubernetes_secret" {
#  source = "../../modules/kubernetes_secret"
#
#  for_each = local.kube_secret_props
#
#  secret_metadata_annotations = each.value.metadata_annotations
#  secret_metadata_labels      = each.value.metadata_labels
#  secret_metadata_name        = each.value.metadata_name
#  secret_metadata_namespace   = each.value.metadata_namespace
#  secret_type                 = each.value.type
#}
#module "helm_release" {
#  source = "../../modules/helm_release"
#
#  for_each = local.helm_package_props
#
#  release_name                   = each.value.name
#  release_chart                  = each.value.chart
#  release_repository             = each.value.repository  
#  release_namespace              = each.value.namespace
#  release_set                    = each.value.set
#
#  depends_on = [ 
#    module.kubernetes_namespace,
#  ]
#}
#module "kubernetes_annotations" {
#  source = "../../modules/kubernetes_annotations"
#
#  for_each = local.kube_annotations
#
#  annotations_api_version        = each.value.api_version
#  annotations_kind               = each.value.kind
#  annotations_metadata           = each.value.metadata
#  annotations_annotations        = each.value.annotations
#
#  depends_on = [ 
#    module.helm_release,
#  ]
#}
##############################
# Fifth Plan and Apply Cycle
##############################
#resource "kubernetes_manifest" "awspcaclusterissuer_dev_ca_clusterissuer" {
#  manifest = {
#    "apiVersion" = "awspca.cert-manager.io/v1beta1"
#    "kind" = "AWSPCAClusterIssuer"
#    "metadata" = {
#      "name" = "dev-clusterissuer"
#    }
#    "spec" = {
#      "arn"    = module.acmpca_ca["acmpca_ca"].acmpca_ca_arn
#      "region" = "us-east-1"
#    }
#  }
#}
#resource "kubernetes_manifest" "secretproviderclass_nginx_db_secret_provider" {
#  manifest = {
#    "apiVersion" = "secrets-store.csi.x-k8s.io/v1"
#    "kind" = "SecretProviderClass"
#    "metadata" = {
#      "name"      = "nginx-db-secret-provider"
#      "namespace" = "eks-sample-app"
#    }
#    "spec" = {
#      "parameters" = {
#         "objects" = data.template_file.secret_provider_class_object_config.rendered
#      }
#      "provider" = "aws"
#    }
#  }
#}
#resource "kubernetes_manifest" "storageclass_ebs_standard_csi" {
#  manifest = {
#    "allowVolumeExpansion" = true
#    "apiVersion" = "storage.k8s.io/v1"
#    "kind" = "StorageClass"
#    "metadata" = {
#      "name"        = "ebs-standard-csi"
#      "annotations" = {
#        "storageclass.kubernetes.io/is-default-class" = "true"
#      }
#    }
#    "parameters" = {
#      "type"   = "gp2"
#      "fsType" = "ext4"
#    }
#    "provisioner"       = "ebs.csi.aws.com"
#    "reclaimPolicy"     = "Delete"
#    "volumeBindingMode" = "WaitForFirstConsumer"
#  }
#}
#resource "kubernetes_manifest" "persistentvolumeclaim_eks_sample_app_ebs_standard_claim" {
#  manifest = {
#    "apiVersion" = "v1"
#    "kind" = "PersistentVolumeClaim"
#    "metadata" = {
#      "name"      = "ebs-standard-claim"
#      "namespace" = "eks-sample-app"
#    }
#    "spec" = {
#      "accessModes" = [
#        "ReadWriteOnce",
#      ]
#      "resources" = {
#        "requests" = {
#          "storage" = "10Gi"
#        }
#      }
#      "storageClassName" = "ebs-standard-csi"
#    }
#  }
#}
#module "nginx_config_map" {
#  source = "../../modules/kubernetes_config_map"
#
#  for_each = local.nginx_config_map_props
# 
#  config_map_metadata            = each.value.metadata
#  config_map_data                = each.value.data
#}
##############################
# sixth Plan and Apply Cycle  
##############################
#module "kubernetes_deployment" {
#  source = "../../modules/kubernetes_deployment"
#
#  for_each = local.kube_deployment_props
#
#  deployment_metadata_labels                                                         = each.value.metadata_labels
#  deployment_metadata_name                                                           = each.value.metadata_name
#  deployment_metadata_namespace                                                      = each.value.metadata_namespace
#  deployment_spec_replicas                                                           = each.value.spec_replicas
#  deployment_spec_selector                                                           = each.value.spec_selector
#  deployment_spec_strategy                                                           = each.value.spec_strategy
#  deployment_spec_template_metadata_labels                                           = each.value.template_metadata_labels
#  deployment_spec_template_metadata_name                                             = each.value.template_metadata_name
#  deployment_spec_template_spec_node_selector                                        = each.value.node_selector
#  deployment_spec_template_spec_restart_policy                                       = each.value.restart_policy
#  deployment_spec_template_spec_affinity_node_affinity_required_match_expressions    = each.value.node_affinity_required_match_expressions
#  deployment_spec_template_spec_container                                            = each.value.template_spec_container
#  deployment_spec_template_spec_volume                                               = each.value.template_spec_volume
#}
#module "kubernetes_service" {
#  source = "../../modules/kubernetes_service"
#
#  for_each = local.kube_service_props
#
#  service_metadata_labels        = each.value.metadata_labels
#  service_metadata_name          = each.value.metadata_name
#  service_metadata_namespace     = each.value.metadata_namespace
#  service_spec_session_affinity  = each.value.session_affinity
#  service_spec_type              = each.value.type
#  service_spec_selector          = each.value.selector
#  service_spec_port              = each.value.port
#}
##############################
# Seventh Plan and Apply Cycle  
##############################
#module "kubernetes_ingress" {
#  source = "../../modules/kubernetes_ingress"
#
#  for_each = local.kube_ingress_props
#
#  ingress_metadata_annotations                      = each.value.metadata_annotations
#  ingress_metadata_labels                           = each.value.metadata_labels
#  ingress_metadata_name                             = each.value.metadata_name
#  ingress_metadata_namespace                        = each.value.metadata_namespace
#  ingress_spec_ingress_class_name                   = each.value.ingress_class_name
#  ingress_spec_default_backend                      = each.value.default_backend
#  ingress_spec_rule                                 = each.value.rule
#  #ingress_spec_tls                                  = each.value.tls
#}
###############################
# Eighth Plan and Apply Cycle  
###############################
#resource "kubernetes_manifest" "certificate_sitadconsulting_tls_cert" {
#  manifest = {
#    "apiVersion" = "cert-manager.io/v1"
#    "kind" = "Certificate"
#    "metadata" = {
#      "name"      = "sitadconsulting-com-tls"
#      "namespace" = "eks-sample-app"
#    }
#    "spec" = {
#      "commonName" = "www-sitadconsulting-com"
#      "dnsNames" = [
#         "k8s-ekssampl-ekssampl-6a90e9bd72-223802714.us-east-1.elb.amazonaws.com"
#      ]
#      "duration" = "144h0m0s"
#      "issuerRef" = {
#        "group" = "awspca.cert-manager.io"
#        "kind"  = "AWSPCAClusterIssuer"
#        "name"  = "dev-clusterissuer"
#      }
#      "privateKey" = {
#        "algorithm" = "RSA"
#        "size"      = 2048
#      }
#      "renewBefore" = "72h0m0s"
#      "secretName"  = "sitadconsulting-com-tls-cert"
#      "usages" = [
#        "server auth",
#        "client auth",
#      ]
#    }
#  }
#}
##############################################
# This is for VPCLattice - Not in use for now   
###############################################
#resource "kubernetes_manifest" "gateway_nginx-gw" {
#  manifest = {
#    "apiVersion" = "gateway.networking.k8s.io/v1beta1"
#    "kind" = "Gateway"
#    "metadata" = {
#      "annotations" = {
#        "application-networking.k8s.aws/lattice-vpc-association" = "true"
#      }
#      "name"      = "nginx-gw"
#      "namespace" = "default"
#    }
#    "spec" = {
#      "gatewayClassName" = "amazon-vpc-lattice"
#      "listeners" = [
#        {
#          "name"     = "http"
#          "port"     = 80
#          "protocol" = "HTTP"
#        },
#      ]
#    }
#  }
#}
#resource "kubernetes_manifest" "httproute_nginx-routes" {
#  manifest = {
#    "apiVersion" = "gateway.networking.k8s.io/v1beta1"
#    "kind" = "HTTPRoute"
#    "metadata" = {
#      "name"      = "nginx-routes"
#      "namespace" = "eks-sample-app"
#    }
#    "spec" = {
#      "parentRefs" = [
#        {
#          "name"        = "nginx-gw"
#          "sectionName" = "http"
#          "namespace"   = "default" 
#        },
#      ]
#      "rules" = [
#        {
#          "backendRefs" = [
#            {
#              "kind"      = "Service"
#              "name"      = "eks-sample-linux-service"
#              "namespace" = "eks-sample-app"
#              "port"      = 80
#            },
#          ]
#          "matches" = [
#            {
#              "path" = {
#                "type" = "PathPrefix"
#                "value" = "/"
#              }
#            },
#          ]
#        },
#      ]
#    }
#  }
#}
