
###################
# Retrieving Data 
###################

data "aws_partition" "current" {
}
data "aws_caller_identity" "current" {
}
data "aws_region" "current" {
  name = "us-east-1"
}
data "aws_ec2_managed_prefix_list" "vpc_lattice_prefix_list" {
  name = "com.amazonaws.${data.aws_region.current.name}.vpc-lattice"
}
output "vpc_lattice_prefix_list_cidr" {
  description = "VPC Lattice prefix list cidr"
  value       = element(concat(data.aws_ec2_managed_prefix_list.vpc_lattice_prefix_list.entries.*.cidr, [""]), 0)
}
output "vpc_lattice_prefix_list_id" {
  description = "VPC Lattice prefix list id"
  value       = element(concat(data.aws_ec2_managed_prefix_list.vpc_lattice_prefix_list.*.id, [""]), 0)
}
data "aws_ssm_parameter" "eks_ami" {
  name            = "/aws/service/eks/optimized-ami/1.24/amazon-linux-2/recommended/image_id"
  with_decryption = true
}
data "aws_eks_cluster" "cluster" {
  name = module.eks_cluster["dev_cluster"].eks_cluster_name
  depends_on = [ module.eks_cluster ]
}
data "aws_eks_cluster_auth" "cluster" {
  name = module.eks_cluster["dev_cluster"].eks_cluster_name
  depends_on = [ module.eks_cluster ]
}
data "template_file" "eks_workers" {
  template = "${file("${path.module}/templates/eks_workers.sh")}"
  vars = {
    cluster_name               = data.aws_eks_cluster.cluster.name
    endpoint                   = data.aws_eks_cluster.cluster.endpoint
    cluster_auth_base64        = data.aws_eks_cluster.cluster.certificate_authority.0.data
  }
  depends_on = [ module.eks_cluster ]
}
data "template_file" "kubeconfig" {
  template = "${file("${path.module}/templates/kubeconfig.tpl")}"

  vars = {
    cluster_endpoint          = data.aws_eks_cluster.cluster.endpoint
    cluster_auth_base64       = data.aws_eks_cluster.cluster.certificate_authority[0].data
    aws_region                = data.aws_region.current.name
    account_id                = data.aws_caller_identity.current.account_id
    clustername               = data.aws_eks_cluster.cluster.name
  }
  depends_on = [ module.eks_cluster ]
}
data "template_file" "awslbc_irsa_assume_role" {
  template = "${file("${path.module}/policies/awslbc_irsa_assume_role.tpl")}"

  vars = {
    account_id      = data.aws_caller_identity.current.account_id
    aws_region      = data.aws_region.current.name
    oidc_id         = trimprefix(data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer, "https://")
    namespace       = "kube-system"
    service_account = "aws-load-balancer-controller"
  }
  depends_on = [ module.eks_cluster ]
}
data "template_file" "ebs_csi_driver_irsa_assume_role" {
  template = "${file("${path.module}/policies/ebs_csi_driver_irsa_assume_role.tpl")}"

  vars = {
    account_id      = data.aws_caller_identity.current.account_id
    aws_region      = data.aws_region.current.name
    oidc_id         = trimprefix(data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer, "https://")
    namespace       = "kube-system"
    service_account = "ebs-csi-controller-sa"
  }
  depends_on = [ module.eks_cluster ]
}
data "template_file" "awslbc_service_policy" {
  template = "${file("${path.module}/policies/awslbc_service_policy.tpl")}"
  vars = {
  }
}
data "template_file" "eks_admin_user_policy" {
  template = "${file("${path.module}/policies/eks_admin_user_policy.tpl")}"
  vars = {
    account_id                 = data.aws_caller_identity.current.account_id
    aws_region                 = data.aws_region.current.name
  }
  depends_on = [ module.eks_cluster ]
}
data "template_file" "auth_config_mapRoles" {
  template = "${file("${path.module}/templates/aws_auth_config_mapRoles.tpl")}"
  vars = {
    account_id                 = data.aws_caller_identity.current.account_id
    node_role                  = var.node_role
  }
  depends_on = [ module.eks_cluster ]
}
data "template_file" "auth_config_mapUsers" {
  template = "${file("${path.module}/templates/aws_auth_config_mapUsers.tpl")}"
  vars = {
    account_id                 = data.aws_caller_identity.current.account_id
    cluster_admin              = var.cluster_admin
    caller_user_id             = var.caller_user_id
  }
  depends_on = [ module.eks_cluster ]
}
data "template_file" "nginx_config_map" {
  template = "${file("${path.module}/templates/nginx_config_map.tpl")}"
  vars = {
  }
  depends_on = [ module.eks_cluster ]
}
data "template_file" "secret_provider_class_object_config" {
  template = "${file("${path.module}/templates/secret_provider_class_object_config.tpl")}"
  vars = {
    secret_objects_arn                 =  module.secretsmanager_secret["db_secret"].secret_arn
  }
  depends_on = [ module.secretsmanager_secret ]
}
data "template_file" "nginx_db_secret_irsa_assume_role" {
  template = "${file("${path.module}/policies/nginx_db_secret_irsa_assume_role.tpl")}"

  vars = {
    account_id      = data.aws_caller_identity.current.account_id
    aws_region      = data.aws_region.current.name
    oidc_id         = trimprefix(data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer, "https://")
    namespace       = "eks-sample-app"
    service_account = "default"
  }
  depends_on = [ module.eks_cluster ]
}
data "template_file" "awspca_irsa_assume_role" {
  template = "${file("${path.module}/policies/awspca_irsa_assume_role.tpl")}"

  vars = {
    account_id      = data.aws_caller_identity.current.account_id
    aws_region      = data.aws_region.current.name
    oidc_id         = trimprefix(data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer, "https://")
    namespace       = "eks-sample-app"
    service_account = "aws-privateca-issuer"
  }
  depends_on = [ module.eks_cluster ]
}
data "template_file" "awsgatewayapi_irsa_assume_role" {
  template = "${file("${path.module}/policies/awsgatewayapi_irsa_assume_role.tpl")}"

  vars = {
    account_id      = data.aws_caller_identity.current.account_id
    aws_region      = data.aws_region.current.name
    oidc_id         = trimprefix(data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer, "https://")
    namespace       = "aws-application-networking-system"
    service_account = "gateway-api-controller"
  }
  depends_on = [ module.eks_cluster ]
}
data "tls_certificate" "eks_cluster_cert" {
  url = data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer

  depends_on = [ module.eks_cluster ]
}

locals {

  vpc_props = {
    main_vpc = {
      cidr_block           = var.vpc_cidr
      enable_dns_hostnames = true
      enable_dns_support   = true
      tags                 = merge(
        {
          "Name" = format(
            "%s-vpc-%s",
            var.name,
            var.environment,
          )
        },
        var.vpc_tags,
      )
    }
  }
  dhcp_options_props = {
    main_dhcp_options = {
      domain_name          = "ec2.internal"
      domain_name_servers  = ["AmazonProvidedDNS"]
      tags                 = merge(
        {
          "Name" = format(
            "%s-dhcpOptions-%s",
            var.name,
            var.environment,
          )
        },
        var.dhcp_options_tags,
      )
    }
  }
  dhcp_options_assoc_props = {
    main_dhcp_options_assoc = {
      vpc_id               = module.vpc["main_vpc"].vpc_id
      dhcp_options_id      = module.vpc_dhcp_options["main_dhcp_options"].vpc_dhcp_options_id
    }
  }
  igw_props = {
    main_igw = {
      vpc_id               = module.vpc["main_vpc"].vpc_id
      tags                 = merge(
        {
          "Name" = format(
            "%s-internet_gateway-%s",
            var.name,
            var.environment,
          )
        },
        var.internet_gateway_tags,
      )
    }
  }
  vpc_public_subnet_props = {
    us-east-1a = {
      public = {
        vpc_id                  = module.vpc["main_vpc"].vpc_id
        cidr_block              = var.az_1a_public_cidr
        availability_zone       = var.public_az_1a
        map_public_ip_on_launch = true
        tags                    = merge(
          {
            "Name" = format(
              "%s-${var.public_subnet_suffix}-%s",
              var.name,
              var.public_az_1a,
            ) 
          },
          var.public_subnet_tags, 
        )
     }
    },
    us-east-1b = {
      public = {
        vpc_id                  = module.vpc["main_vpc"].vpc_id
        cidr_block              = var.az_1b_public_cidr
        availability_zone       = var.public_az_1b
        map_public_ip_on_launch = true
        tags                    = merge(
          {
            "Name" = format(
              "%s-${var.public_subnet_suffix}-%s",
              var.name,
              var.public_az_1b,
            ) 
          },
          var.public_subnet_tags, 
        )
      }
    }
  }
  vpc_private_subnet_props = {
    us-east-1a = {
      private = {
        vpc_id                  = module.vpc["main_vpc"].vpc_id
        cidr_block              = var.az_1a_private_cidr
        availability_zone       = var.private_az_1a
        map_public_ip_on_launch = false
        tags                    = merge(
          {
            "Name" = format(
              "%s-${var.private_subnet_suffix}-%s",
              var.name,
              var.private_az_1a,
            ) 
          },
          var.private_subnet_tags, 
        )
      }
    },
    us-east-1b = {
      private = {
        vpc_id                  = module.vpc["main_vpc"].vpc_id
        cidr_block              = var.az_1b_private_cidr
        availability_zone       = var.private_az_1b
        map_public_ip_on_launch = false
        tags                    = merge(
          {
            "Name" = format(
              "%s-${var.private_subnet_suffix}-%s",
              var.name,
              var.private_az_1b,
            ) 
          },
          var.private_subnet_tags, 
        )
      }
    }
  }
  eip_props = {
    ngw1_eip = {
      vpc                     = true
      tags                    = merge(
        {
          "Name" = format(
            "%s-eip-%s",
            var.name,
            var.environment,
          ) 
        },
        var.eip_tags, 
      )
    }
  }
  ngw_props = {
    ngw1 = {
      allocation_id        = module.eip["ngw1_eip"].eip_id
      subnet_id            = module.public_subnet["us-east-1a"].public_subnet_id
    }
  }
  route_table_props = {
    us-east-1a = {
      public = {
        vpc_id                           = module.vpc["main_vpc"].vpc_id
      },
      private = {
        vpc_id                           = module.vpc["main_vpc"].vpc_id
      }
    },
    us-east-1b = {
      public = {
        vpc_id                          = module.vpc["main_vpc"].vpc_id
      },
      private = {
        vpc_id                          = module.vpc["main_vpc"].vpc_id
      }
    }
  }
  route_table_assoc_props = {
    us-east-1a = {
      public = {
        subnet_id                          = module.public_subnet["us-east-1a"].public_subnet_id
        route_table_id                     = module.public_route_table["us-east-1a"].public_route_table_id
      },
      private = {
        subnet_id                          = module.private_subnet["us-east-1a"].private_subnet_id
        route_table_id                     = module.private_route_table["us-east-1a"].private_route_table_id
      }
    },
    us-east-1b = {
      public = {
        subnet_id                          = module.public_subnet["us-east-1b"].public_subnet_id
        route_table_id                     = module.public_route_table["us-east-1a"].public_route_table_id
      },
      private = {
        subnet_id                          = module.private_subnet["us-east-1b"].private_subnet_id
        route_table_id                     = module.private_route_table["us-east-1b"].private_route_table_id
      }
    }
  }
  route_props = {
    us-east-1a = {
      public = {
        route_table_id                     = module.public_route_table["us-east-1a"].public_route_table_id
        gateway_id                         = module.internet_gateway["main_igw"].internet_gateway_id
        destination_cidr_block             = "0.0.0.0/0"
      },
      private = {
        route_table_id                     = module.private_route_table["us-east-1a"].private_route_table_id
        nat_gateway_id                     = module.nat_gateway["ngw1"].nat_gateway_id
        destination_cidr_block             = "0.0.0.0/0"
      }
    },
    us-east-1b = {
      public = {
        route_table_id                     = module.public_route_table["us-east-1b"].public_route_table_id
        gateway_id                         = module.internet_gateway["main_igw"].internet_gateway_id
        destination_cidr_block             = "0.0.0.0/0"
      },
      private = {
        route_table_id                     = module.private_route_table["us-east-1b"].private_route_table_id
        nat_gateway_id                     = module.nat_gateway["ngw1"].nat_gateway_id
        destination_cidr_block             = "0.0.0.0/0"
      }
    }
  }
  eks_cluster_props = {
    dev_cluster = {
      name                      = var.cluster_name
      role_arn                  = module.eks_cluster_iam_role["eks_cluster_iam_role"].iam_role_arn
      enabled_cluster_log_types = []
      vpc_config = [
        {
          endpoint_private_access = true
          endpoint_public_access  = true
          public_access_cidrs     = var.public_access_cidrs
          security_group_ids      = []
          subnet_ids              = [
            module.public_subnet["us-east-1a"].public_subnet_id,
            module.public_subnet["us-east-1b"].public_subnet_id,
            module.private_subnet["us-east-1a"].private_subnet_id,
            module.private_subnet["us-east-1b"].private_subnet_id,
          ]
        },
      ]
      tags                      = merge(
        {
          "Name" = format(
            "%s-eks_cluster-%s",
            var.name,
            var.environment,
          ) 
        },
        var.eks_cluster_tags, 
      )
    }
  }
  eks_cluster_iam_role_props = {
    eks_cluster_iam_role  = {
      name                          = var.cluster_iam_role_name
      description                   = "EKS cluster assume trust role"
      assume_role_policy            = templatefile("${path.module}/policies/ekscluster_assume_role.tftpl", {})
      path                          = "/"
      tags                          = merge(
        {
          "Name" = format(
            "%s-eksClusterRole-%s",
            var.name,
            var.environment,
          ) 
        },
        var.iam_role_tags, 
      )
    }
  }
  eks_cluster_iam_policy_attachment_props = {
    eks_iam_role_policy_attachment = {
      role        = module.eks_cluster_iam_role["eks_cluster_iam_role"].iam_role_name
      policy_arn  = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    }
  }
  eks_oidc_provider_props = {
    oidc_provider = {
      client_id_list  = ["sts.amazonaws.com"]
      thumbprint_list = [ data.tls_certificate.eks_cluster_cert.certificates[0].sha1_fingerprint ]
      url             = data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer
    }
  }  
  local_file_props = {
    kubeconfig_file = {
      content              = data.template_file.kubeconfig.rendered 
      filename             = pathexpand("~/.kube/config")
      directory_permission = "0700"
      file_permission      = "0600"
    }
  }
  key_pair_props = {
    eks_node_group_key_pair = {
      key_name       = "eks_node_group-key"
      public_key     = var.node_group_public_key
    }
  }
  security_group_props = {
    workers_sg = {
      name        = "worker"
      description = "Worker Nodes Security Group"
      vpc_id      = module.vpc["main_vpc"].vpc_id
    },
  }
  security_group_rule_props = {
    workers_ingress = {
      cidr_blocks              = null
      description              = "Allow nodes to communicate with each other"
      from_port                = 0
      protocol                 = "-1"
      security_group_id        = module.security_group["workers_sg"].security_group_id
      source_security_group_id = module.security_group["workers_sg"].security_group_id
      to_port                  = 65535
      type                     = "ingress"
    },
    cluster_control_plane_ingress = {
      cidr_blocks              = null
      description              = "Allow pods to communicate with the cluster API Server"
      from_port                = 443
      protocol                 = "tcp"
      security_group_id        = module.eks_cluster["dev_cluster"].eks_cluster_security_group_id 
      source_security_group_id = module.security_group["workers_sg"].security_group_id
      to_port                  = 443
      type                     = "ingress"
    },
    ccp_egress_to_workers_sg = {
      cidr_blocks              = null
      description              = "Allow the cluster control plane to communicate with worker Kubelet and pods"
      from_port                = 1025
      protocol                 = "tcp"
      security_group_id        = module.eks_cluster["dev_cluster"].eks_cluster_security_group_id
      source_security_group_id = module.security_group["workers_sg"].security_group_id
      to_port                  = 65535
      type                     = "egress"
    },
    workers_sg_ingress_from_ccp = {
      cidr_blocks              = null
      description              = "Allow worker Kubelets and pods to receive communication from the cluster control plane"
      from_port                = 1025
      protocol                 = "tcp"
      security_group_id        = module.security_group["workers_sg"].security_group_id
      source_security_group_id = module.eks_cluster["dev_cluster"].eks_cluster_security_group_id
      to_port                  = 65535
      type                     = "ingress"
    },
    ccp_egress_to_workers_sg_443 = {
      cidr_blocks              = null
      description              = "Allow the cluster control plane to communicate with pods running extension API servers on port 443"
      from_port                = 443
      protocol                 = "tcp"
      security_group_id        = module.eks_cluster["dev_cluster"].eks_cluster_security_group_id
      source_security_group_id = module.security_group["workers_sg"].security_group_id
      to_port                  = 443
      type                     = "egress"
    },
    workers_sg_ingress_from_ccp_443 = {
      cidr_blocks              = null
      description              = "Allow pods running extension API servers on port 443 to receive communication from cluster control plane"
      from_port                = 443
      protocol                 = "tcp"
      security_group_id        = module.security_group["workers_sg"].security_group_id
      source_security_group_id = module.eks_cluster["dev_cluster"].eks_cluster_security_group_id
      to_port                  = 443
      type                     = "ingress"
    },
    workers_sg_ingress_from_remote_22 = {
     cidr_blocks              = var.public_access_cidrs
     description              = "Allow remote access to worker nodes"
     from_port                = 22
     protocol                 = "tcp"
     security_group_id        = module.security_group["workers_sg"].security_group_id
     source_security_group_id = null
     to_port                  = 22
     type                     = "ingress"
    },
    workers_sg_egress_to_exnet = {
     cidr_blocks              = [ "0.0.0.0/0",]
     description              = "Allow worker nodes to initiate outbound access to external networks"
     from_port                = 0
     protocol                 = "-1"
     security_group_id        = module.security_group["workers_sg"].security_group_id
     source_security_group_id = null
     to_port                  = 0
     type                     = "egress"
    },
    vpc_lattice_to_ccp = {
      cidr_blocks              = [ element(concat(data.aws_ec2_managed_prefix_list.vpc_lattice_prefix_list.entries.*.cidr, [""]), 0) ]
      description              = "VPC-Lattice to ccp"
      from_port                = 1
      protocol                 = "tcp"
      security_group_id        = module.eks_cluster["dev_cluster"].eks_cluster_security_group_id
      source_security_group_id = null
      to_port                  = 65535
      type                     = "ingress"
    },
    ccp_to_vpc_lattice = {
      cidr_blocks              = [ element(concat(data.aws_ec2_managed_prefix_list.vpc_lattice_prefix_list.entries.*.cidr, [""]), 0) ]
      description              = "VPC-Lattice to ccp"
      from_port                = 1
      protocol                 = "tcp"
      security_group_id        = module.eks_cluster["dev_cluster"].eks_cluster_security_group_id
      source_security_group_id = null
      to_port                  = 65535
      type                     = "egress"
    },
    vpc_lattice_to_workers_sg = {
      cidr_blocks              = [ element(concat(data.aws_ec2_managed_prefix_list.vpc_lattice_prefix_list.entries.*.cidr, [""]), 0) ]
      description              = "VPC-Lattice to pods communication"
      from_port                = 1
      protocol                 = "tcp"
      security_group_id        = module.security_group["workers_sg"].security_group_id
      source_security_group_id = null
      to_port                  = 65535
      type                     = "ingress"
    },
    workers_sg_to_vpc_lattice = {
      cidr_blocks              = [ element(concat(data.aws_ec2_managed_prefix_list.vpc_lattice_prefix_list.entries.*.cidr, [""]), 0) ]
      description              = "Pods to VPC-Lattice communication"
      from_port                = 1
      protocol                 = "tcp"
      security_group_id        = module.security_group["workers_sg"].security_group_id
      source_security_group_id = null
      to_port                  = 65535
      type                     = "egress"
    },
  } 
  iam_instance_profile_props = {
    workers_instance_profile = {
      name   = "workers"
      path   = "/"
      role   = module.eks_node_group_iam_role["eks_node_group_iam_role"].iam_role_name
    }
  }
  launch_template_props = {
    lt_latest = {
      default_version                      = "1"
      description                          = "Eks Node Group workers launch template"
      disable_api_stop                     = false
      disable_api_termination              = false
      ebs_optimized                        = false
      image_id                             = data.aws_ssm_parameter.eks_ami.value
      instance_type                        = "t3.large"
      key_name                             = module.key_pair["eks_node_group_key_pair"].key_pair_name
      name                                 = "sitadinfra-Eks_Node_Group-lt-web-dev"
      user_data                            = "${base64encode(data.template_file.eks_workers.rendered)}" 
      
      block_device_mappings = [
        {
           device_name = "/dev/sdg"
           ebs = [
             {
               delete_on_termination = true
               volume_size           = 10
               volume_type           = "gp2"
             },
           ]
        },
      ]
      iam_instance_profile = [
        {
          arn   =  module.iam_instance_profile["workers_instance_profile"].iam_instance_profile_arn
        },
      ]
      metadata_options = [
        {
          http_endpoint               = "enabled"
          http_tokens                 = "optional"
          http_put_response_hop_limit = 2
        },
      ]
      monitoring = [
        {
          enabled = false

        },
      ]
      network_interfaces = [
        {
            security_groups = [ module.security_group["workers_sg"].security_group_id, ]
        },
      ]
    }
  }
  autoscaling_group_props = {
    eks_workers_asg = {
      default_instance_warmup = "1800"
      desired_capacity        = 2
      launch_configuration    = "launch_template"
      max_size                = 3
      min_size                = 1
      name                    = "sitadinfra_eks_workers"
      vpc_zone_identifier     = [ module.public_subnet["us-east-1a"].public_subnet_id, module.public_subnet["us-east-1b"].public_subnet_id ]
      
      launch_template = [
        {
          id        = module.launch_template["lt_latest"].launch_template_id
          #version   = module.launch_template["lt_latest"].launch_template_latest_version
        },
      ]
   
      instance_refresh = [
        {
          strategy        = "Rolling"
          #trigger         = "launch_template"
          preferences     = [
            {
              refresh_preference = [
                {
                  checkpoint_delay       = 1800
                  checkpoint_percentages = [ 20, 40, 100, ]
                  instance_warmup        = 300
                  min_healthy_percentage = 50
                },
              ]
           },
         ]
        },
      ]
      autoscaling_group_tag = [
        {
          key                 = "kubernetes.io/cluster/${data.aws_eks_cluster.cluster.name}"
          value               = "owned"
          propagate_at_launch = true
        },
        {
          key                 = "kubernetes.io/os"
          value               = "linux"
          propagate_at_launch = true
        },
        {
          key                 = "tier"
          value               = "frontend_workers"
          propagate_at_launch = true
        },
        {
          key                 = "environment"
          value               = "DEV"
          propagate_at_launch = true
        },
      ]
    }
  }
  eks_node_group_iam_role_props = {
    eks_node_group_iam_role  = {
      name                          = var.node_group_iam_role
      description                   = "EKS Node assume trust role"
      assume_role_policy            = templatefile("${path.module}/policies/eksnodegroup_assume_role.tftpl", {})
      path                          = "/"
      tags                          = merge(
        {
          "Name" = format(
            "%s-AmazonEKSNodeIamRole-%s",
            var.name,
            var.environment,
          ) 
        },
        var.iam_role_tags, 
      )
    }
  }
  eks_worker_node_policy_iam_policy_attachment_props = {
    worker_node_policy_attachment = {
      role        = module.eks_node_group_iam_role["eks_node_group_iam_role"].iam_role_name
      policy_arn  = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    }
  }
  eks_cni_policy_iam_policy_attachment_props = {
    eks_cni_policy_attachment = {
      role        = module.eks_node_group_iam_role["eks_node_group_iam_role"].iam_role_name
      policy_arn  = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    }
  }
  eks_container_registry_iam_policy_attachment_props = {
    ec2_container_policy_attachment = {
      role        = module.eks_node_group_iam_role["eks_node_group_iam_role"].iam_role_name
      policy_arn  = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    }
  }
  eks_lb_controller_iam_role_props = {
    eks_lb_controller_iam_role = {
      name                         = var.aws_lb_controller_iam_role_name
      description                  = "EKS AWS loadbalancer controller trust role"
      assume_role_policy           = data.template_file.awslbc_irsa_assume_role.rendered
      path                         = "/"
      tags                          = merge(
        {
          "Name" = format(
            "%s-AmazonEKSLoadBalancerControllerIamRole-%s",
            var.name,
            var.environment,
          ) 
        },
        var.iam_role_tags, 
      )
    }
  }
  eks_lb_controller_iam_policy_props = {
    awslbc_service_policy = {
      name        = var.awslbc_iam_policy_name
      description = "AWS Loadbalancer Controller service policy Name"
      policy      = data.template_file.awslbc_service_policy.rendered
      path        = "/"
      tags        = merge(
        {
          "Name" = format(
            "%s-AWSLBC_IamPolicy-%s",
            var.name,
            var.environment,
          )
        },
        var.iam_policy_tags,
      )
    }
  }
  eks_lb_controller_iam_policy_attachment_props = {
    awslbc_service_policy_attachment = {
      role       = module.eks_lb_controller_iam_role["eks_lb_controller_iam_role"].iam_role_name
      policy_arn = module.eks_lb_controller_iam_policy["awslbc_service_policy"].iam_policy_arn
    }
  }
  eks_ebs_csi_driver_iam_role_props = {
    ebs_csi_driver_iam_role = {
      name                = var.ebs_csi_driver_iam_role_name
      description         = "EKS EBS CSI driver trust role"
      assume_role_policy  = data.template_file.ebs_csi_driver_irsa_assume_role.rendered
      path                = "/"
      tags                = merge(
        {
          "Name" = format(
            "%s-AmazonEKSEbsCsiDriverIamRole-%s",
            var.name,
            var.environment,
          ) 
        },
        var.iam_role_tags, 
      )
    }
  }
  eks_ebs_csi_driver_iam_policy_attachment_props = {
    ebs_csi_driver_iam_policy_attachment  = {
      role        = module.eks_ebs_csi_driver_iam_role["ebs_csi_driver_iam_role"].iam_role_name
      policy_arn  = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
    }
  }
  eks_iam_user_props = {
    eks_admin_user = {
      name          = var.eks_cluster_admin_user
      path          = "/"
      force_destroy = true
    }
  }
  eks_iam_user_policy_props = {
    eks_admin_user_policy = {
      name               = var.eks_admin_user_policy_name
      description        = "EKS Cluster Admin User Policy"
      policy             = data.template_file.eks_admin_user_policy.rendered
      path               = "/"
    }
  }
  eks_iam_user_policy_attachment_props = {
    eks_admin_user_policy_attachment ={
      user       = module.iam_user["eks_admin_user"].iam_user_name
      policy_arn = module.iam_user_policy["eks_admin_user_policy"].iam_policy_arn
    }
  }
  iam_access_key_props = {
    eks_admin_user_key = {
      pgp_key = filebase64("${path.module}/config/sitadinfra.gpg")
      status  = "Active"
      user    =  module.iam_user["eks_admin_user"].iam_user_name
    }
  }
  iam_user_login_profile_props = {
    eks_admin_login_profile = {
      user                    = module.iam_user["eks_admin_user"].iam_user_name
      pgp_key                 = filebase64("${path.module}/config/sitadinfra.gpg")
      password_length         = 10
      password_reset_required = true
    }
  }
  time_sleep_props = {
    sleep_time = {
      create_duration = "10m"
    }
  }
  nginx_db_secret_iam_role_props = {
   nginx_db_secret_iam_role = {
      name                         = var.nginx_db_secret_iam_role_name
      description                  = "Nginx DB Secret trust role"
      assume_role_policy           = data.template_file.nginx_db_secret_irsa_assume_role.rendered
      path                         = "/"
      tags        = merge(
        {
          "Name" = format(
            "%s-nginxDBSecretIamRole-%s",
            var.name,
            var.environment,
          )
        },
        var.iam_policy_tags,
      )
    }
  }
  nginx_db_secret_iam_policy_attachment_props = {
    nginx_db_secret_iam_policy_attachment = {
      role       = module.nginx_db_secret_iam_role["nginx_db_secret_iam_role"].iam_role_name
      policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
    }
  }
  nginx_db_secret_props = {
    db_secret = {
      description = "nginx db secret"
      name        = "nginx-db-secret"
      tags        = {
        env    = "sitadinfra-dev"
      }
    }
  }
  nginx_db_secret_version_props = {
    db_secret_version = {
      secret_id     = module.secretsmanager_secret["db_secret"].secret_arn
      secret_string = jsonencode({
        username  = "nginx-app-db-user"
        password  = "testingdbpassword"
      })
    }
  }
  awspca_iam_role_props = {
    awspca_iam_role = {
      name                         = var.awspca_iam_role_name
      description                  = "AWSPCA Issuer trust role"
      assume_role_policy           = data.template_file.awspca_irsa_assume_role.rendered
      path                         = "/"
      tags                         = merge(
        {
          "Name" = format(
            "%s-awspcaIamRole-%s",
            var.name,
            var.environment,
          )
        },
        var.iam_policy_tags,
      )
    }
  }
  awspca_iam_policy_attachment_props = {
    awspca_iam_policy_attachment = {
      role       = module.eks_node_group_iam_role["eks_node_group_iam_role"].iam_role_name
      #role       = module.awspca_iam_role["awspca_iam_role"].iam_role_name
      policy_arn = "arn:aws:iam::aws:policy/AWSPrivateCAFullAccess"
    }
  }
  awsgatewayapi_iam_role_props = {
    awsgatewayapi_iam_role = {
      name                         = var.awsgatewayapi_iam_role_name
      description                  = "AWSGATEWAYAPI trust role"
      assume_role_policy           = data.template_file.awsgatewayapi_irsa_assume_role.rendered
      path                         = "/"
      tags        = merge(
        {
          "Name" = format(
            "%s-awsgatewayapiIamRole-%s",
            var.name,
            var.environment,
          )
        },
        var.iam_policy_tags,
      )
    }
  }
  awsgatewayapi_iam_policy_attachment_props = {
    awsgatewayapi_iam_policy_attachment = {
      role       = module.awsgatewayapi_iam_role["awsgatewayapi_iam_role"].iam_role_name
      policy_arn = "arn:aws:iam::aws:policy/VPCLatticeFullAccess"
    }
  }
  acm_certificate_props = {
    acm_certificate = {
      domain_name       = var.acm_certificate_domain_name
      key_algorithm     = "RSA_2048"
      options           = [
        {
          certificate_transparency_logging_preference = "DISABLED"
        },
      ]
      certificate_authority_arn                       = module.acmpca_ca["acmpca_ca"].acmpca_ca_arn
      early_renewal_duration                          = "P90D"   
      tags                                            = {
        name        = "sitadinfra-acm-private-ca-certificate"
        environment = "DEV"
        owner       = "sitadconsulting"
        project     = "sitadinfra"
      }
    }
  }
  acmpca_ca_props = {
    acmpca_ca = {
      usage_mode  = "SHORT_LIVED_CERTIFICATE"
      tags        = {
        name        = "sitadinfra-acm-private-ca"
        environment = "DEV"
        owner       = "sitadconsulting"
        project     = "sitadinfra"
      } 
      type        = "ROOT"
      certificate_authority_configuration = [
        {
           key_algorithm     = "RSA_2048"
           signing_algorithm = "SHA256WITHRSA"
           subject           = [
             {
               common_name         = "sitadCa"
               country             = "UK"
               organization        = "sitadconsulting"
               organizational_unit = "sitadinfra" 
               locality            = "London"
             },
           ]  
        },
      ]
      revocation_configuration = [
        {
           ocsp_configuration = [
             {
               enabled = true
             },
           ]
        },
      ]
    }
  }
  acmpca_ca_certificate_props = {
    acmpca_ca_certificate = {
      certificate               = module.acmpca_certificate["acmpca_cerificate"].acmpca_certificate
      certificate_authority_arn = module.acmpca_ca["acmpca_ca"].acmpca_ca_arn
    }
  }
  acmpca_certificate_props = {
    acmpca_cerificate = {
      certificate_authority_arn   = module.acmpca_ca["acmpca_ca"].acmpca_ca_arn
      certificate_signing_request = module.acmpca_ca["acmpca_ca"].acmpca_ca_certificate_signing_request
      signing_algorithm           = "SHA256WITHRSA"
      template_arn                = "arn:aws:acm-pca:::template/RootCACertificate/V1"
      validity                    = [
        {
          type  = "DAYS"
          value = 7
        },
      ]
    }
  }
  acmpca_permission_props = {
    acmpca_permission = {
      certificate_authority_arn = module.acmpca_ca["acmpca_ca"].acmpca_ca_arn
      actions                   = [ "IssueCertificate", "GetCertificate", "ListPermissions" ]
      principal                 = "acm.amazonaws.com"
    }
  }
}
