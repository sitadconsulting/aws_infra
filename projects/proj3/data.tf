###################
# Retrieving Data
###################

data "aws_partition" "current" {
}
data "aws_caller_identity" "current" {
}
data "aws_availability_zones" "available" {
  state = "available"
}
data "aws_region" "current" {
  name = "us-east-1"
}
data "aws_ssm_parameter" "kafka_client_instance_ami" {
  name            = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-6.1-x86_64"
  with_decryption = true
}
data "template_file" "ec2_iam_role_trust_policy" {
  template = "${file("${path.module}/policies/ec2_iam_role_trust_policy.tpl")}"
  vars = {
    account_id        = data.aws_caller_identity.current.account_id
  }
}
data "template_file" "connect_distributed_property_file" {
  template = "${file("${path.module}/config/connect-distributed.properties")}"
  vars = {
  }
}
data "template_file" "kafka_connect_iam_role_trust_policy" {
  template = "${file("${path.module}/policies/kafka_connect_iam_role_trust_policy.tpl")}"
  vars = {
    account_id        = data.aws_caller_identity.current.account_id
  }
}
data "template_file" "kafka_connect_iam_policy" {
  template = "${file("${path.module}/policies/kafka_connect_iam_policy.tpl")}"
  vars = {
    kafka_connect_target_bucket = module.kafka_connect_target_bucket["kafka_connect_target_bucket"].s3_bucket_id
    account_id                  = data.aws_caller_identity.current.account_id
    msk_cluster_name            = var.msk_cluster_name
    msk_cluster_uuid            = local.msk_cluster_uuid
    aws_region                  = data.aws_region.current.name
  }
  depends_on = [ 
    module.kafka_connect_target_bucket,
    module.msk_cluster,
  ]
}
data "template_file" "kafka_authorization_policy" {
  template = "${file("${path.module}/policies/kafka_authorization_policy.tpl")}"
  vars = {
    aws_region                  = data.aws_region.current.name
    account_id                  = data.aws_caller_identity.current.account_id
    msk_cluster_name            = var.msk_cluster_name
    msk_cluster_uuid            = local.msk_cluster_uuid
    kafka_connect_target_bucket = module.kafka_connect_target_bucket["kafka_connect_target_bucket"].s3_bucket_id
  }
  depends_on = [ 
    module.msk_cluster,
    module.kafka_connect_target_bucket,
  ]
}
data "template_file" "kafka_client_instance" {
  template = "${file("${path.module}/templates/kafka_client_instance.sh")}"
  vars = {
    bootstrapserver_iam         = module.msk_cluster["msk_cluster"].msk_cluster_bootstrap_brokers_sasl_iam
    bootstrapserver_tls         = module.msk_cluster["msk_cluster"].msk_cluster_bootstrap_brokers_tls
    rds_aurora_endpoint         = module.sales_db_rds_cluster_instance["sales_db_cluster_instance"].rds_cluster_instance_endpoint
    database_password           = var.database_password
    kafka_connect_target_bucket = module.kafka_connect_target_bucket["kafka_connect_target_bucket"].s3_bucket_id
    ssl_keystore_password       = var.ssl_keystore_password
    ssl_key_password            = var.ssl_key_password
    trust_store_password        = var.trust_store_password
  }
  depends_on = [ 
    module.sales_db_rds_cluster_instance,
    module.msk_cluster,
    module.kafka_connect_target_bucket,
  ]
}
data "template_file" "server_properties" {
  template = "${file("${path.module}/config/server.properties")}"
  vars = {
  }
}
data "aws_msk_cluster" "msk_cluster" {
  cluster_name = var.msk_cluster_name

  depends_on = [ 
    module.msk_cluster,
  ]
}
output "msk_cluster_uuid" {
  description = "Cluster identifier in the form 'cluster/<ClusteName>/<UUID>'"
  value       = element(concat(split("/",element(concat(split(":",data.aws_msk_cluster.msk_cluster.arn), [""]), 5)), [""]), 2)
}
data "aws_instance" "kafka_client_instance" {
  instance_id = element(concat(split("/",element(concat(split(":",module.kafka_client_instance["kafka_client_instance"].instance_arn), [""]), 5)), [""]), 1)

  depends_on = [ 
    module.kafka_client_instance,
  ]
}


locals {

  
  msk_cluster_uuid = element(concat(split("/",element(concat(split(":",data.aws_msk_cluster.msk_cluster.arn), [""]), 5)), [""]), 2)
  
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
  public_subnet_1a_props = {
    public_subnet_1a = {
      vpc_id                  = module.vpc["main_vpc"].vpc_id
      cidr_block              = var.public_subnet_1a_cidr
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
  }
  public_subnet_1b_props = {
    public_subnet_1b = {
      vpc_id                  = module.vpc["main_vpc"].vpc_id
      cidr_block              = var.public_subnet_1b_cidr
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
  public_subnet_1c_props = {
    public_subnet_1c = {
      vpc_id                  = module.vpc["main_vpc"].vpc_id
      cidr_block              = var.public_subnet_1c_cidr
      availability_zone       = var.public_az_1c
      map_public_ip_on_launch = true
      tags                    = merge(
        {
           "Name" = format(
             "%s-${var.public_subnet_suffix}-%s",
             var.name,
             var.public_az_1c,
           )
        },
        var.public_subnet_tags,
      ) 
    }
  }
  private_subnet_1a_props = {
    private_subnet_1a = {
      vpc_id                  = module.vpc["main_vpc"].vpc_id
      cidr_block              = var.private_subnet_1a_cidr
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
  }
  private_subnet_1b_props = {
    private_subnet_1b = {
      vpc_id                  = module.vpc["main_vpc"].vpc_id
      cidr_block              = var.private_subnet_1b_cidr
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
  private_subnet_1c_props = {
    private_subnet_1c = {
      vpc_id                  = module.vpc["main_vpc"].vpc_id
      cidr_block              = var.private_subnet_1c_cidr
      availability_zone       = var.private_az_1c
      map_public_ip_on_launch = false
      tags                    = merge(
        {
           "Name" = format(
             "%s-${var.private_subnet_suffix}-%s",
             var.name,
             var.private_az_1c,
           )
        },
        var.private_subnet_tags,
      ) 
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
      subnet_id            = module.public_subnet_1a["public_subnet_1a"].public_subnet_id
    }
  }
  public_route_table_props = {
    public_route_table = {
      vpc_id                           = module.vpc["main_vpc"].vpc_id
    }
  }
  private_route_table_props = {
    private_route_table = {
      vpc_id                           = module.vpc["main_vpc"].vpc_id
    }
  }
  public_route_table_assoc_props = {
    subnet_1a = {
      subnet_id                          = module.public_subnet_1a["public_subnet_1a"].public_subnet_id
      route_table_id                     = module.public_route_table["public_route_table"].public_route_table_id
    },
    subnet_1b = {
      subnet_id                          = module.public_subnet_1b["public_subnet_1b"].public_subnet_id
      route_table_id                     = module.public_route_table["public_route_table"].public_route_table_id
    },
    subnet_1c = {
      subnet_id                          = module.public_subnet_1c["public_subnet_1c"].public_subnet_id
      route_table_id                     = module.public_route_table["public_route_table"].public_route_table_id
    }
  }
  private_route_table_assoc_props = {
    subnet_1a = {
      subnet_id                          = module.private_subnet_1a["private_subnet_1a"].private_subnet_id
      route_table_id                     = module.private_route_table["private_route_table"].private_route_table_id
    },
    subnet_1b = {
      subnet_id                          = module.private_subnet_1b["private_subnet_1b"].private_subnet_id
      route_table_id                     = module.private_route_table["private_route_table"].private_route_table_id
    },
    subnet_1c = {
      subnet_id                          = module.private_subnet_1c["private_subnet_1c"].private_subnet_id
      route_table_id                     = module.private_route_table["private_route_table"].private_route_table_id
    }
  }
  public_route_props = {
    igw_route = {
      route_table_id                     = module.public_route_table["public_route_table"].public_route_table_id
      gateway_id                         = module.internet_gateway["main_igw"].internet_gateway_id
      destination_cidr_block             = "0.0.0.0/0"
    }
  }
  private_route_props = {
    ngw_route = {
      route_table_id                     = module.private_route_table["private_route_table"].private_route_table_id
      nat_gateway_id                     = module.nat_gateway["ngw1"].nat_gateway_id
      destination_cidr_block             = "0.0.0.0/0"
    }
  }
  security_group_props = {
    s3_endpoint_sg = {
      name        = "s3_endpoint_sg"
      description = "S3 endpoint security group"
      vpc_id      = module.vpc["main_vpc"].vpc_id
    },
    kafka_client_instance_sg = {
      name        = "kafka_client_instance_sg"
      description = "Kafka client instance security group"
      vpc_id      = module.vpc["main_vpc"].vpc_id
    },
    msk_sg = {
      name        = "msk_sg"
      description = "MSK Security Group"
      vpc_id      = module.vpc["main_vpc"].vpc_id
    },
    mskconnect_sg = {
      name        = "mskconnect_sg"
      description = "MSKConnect Security Group"
      vpc_id      = module.vpc["main_vpc"].vpc_id
    },
    auroradb_sg = {
      name        = "auroradb_sg"
      description = "Aurora Database Security Group"
      vpc_id      = module.vpc["main_vpc"].vpc_id
    },
  }
  security_group_rule_props = {
    msk_node_to_node = {
      cidr_blocks              = null
      description              = "Allow MSK nodes to communicate with each other"
      from_port                = -1
      protocol                 = "-1"
      security_group_id        = module.security_group["msk_sg"].security_group_id
      source_security_group_id = module.security_group["msk_sg"].security_group_id
      to_port                  = -1
      type                     = "ingress"
    },
    msk_node_to_s3_endpoint = {
      cidr_blocks              = null
      description              = "Allow MSK nodes to communicate with s3 endpoint"
      from_port                = -1
      protocol                 = "-1"
      security_group_id        = module.security_group["msk_sg"].security_group_id
      source_security_group_id = module.security_group["s3_endpoint_sg"].security_group_id
      to_port                  = -1
      type                     = "egress"
    },
    msk_node_to_s3_endpoint_ingress = {
      cidr_blocks              = null
      description              = "Allow s3 endpoint to receive communication from MSK nodes"
      from_port                = 443
      protocol                 = "-1"
      security_group_id        = module.security_group["s3_endpoint_sg"].security_group_id
      source_security_group_id = module.security_group["msk_sg"].security_group_id
      to_port                  = 443
      type                     = "ingress"
    },
    kafka_client_instance_egress_to_extnet = {
     cidr_blocks              = [ "0.0.0.0/0",]
     description              = "Allow Kafka client instance to initiate outbound access to external networks"
     from_port                = 443
     protocol                 = "-1"
     security_group_id        = module.security_group["kafka_client_instance_sg"].security_group_id
     source_security_group_id = null
     to_port                  = 443
     type                     = "egress"
    },
    remote_to_Kafka_client_instance_on_port_22 = {
      cidr_blocks              = var.remote_access_to_kafka_client_instance_port_22
      description              = "Allow remote access into Kafka client instance on port 22"
      from_port                = 22
      protocol                 = "tcp"
      security_group_id        = module.security_group["kafka_client_instance_sg"].security_group_id
      source_security_group_id = null
      to_port                  = 22
      type                     = "ingress"
    },
    remote_to_kafka_client_instance_on_port_8081 = {
      cidr_blocks              = var.remote_access_to_kafka_client_instance_port_8081
      description              = "Allow remote access into Kafka client instance on port 8081"
      from_port                = 8081
      protocol                 = "tcp"
      security_group_id        = module.security_group["kafka_client_instance_sg"].security_group_id
      source_security_group_id = null
      to_port                  = 8081
      type                     = "ingress"
    },
    ingress_from_kafka_client_instance_to_msk_on_port_2182 = {
      cidr_blocks              = null
      description              = "Allow MSK cluster to receive communication from kafka client instance on port 2182 - Zookeeper access"
      from_port                = 2182
      protocol                 = "tcp"
      security_group_id        = module.security_group["msk_sg"].security_group_id
      source_security_group_id = module.security_group["kafka_client_instance_sg"].security_group_id
      to_port                  = 2182
      type                     = "ingress"
    },
    ingress_from_mskconnect_to_msk_on_port_2182 = {
      cidr_blocks              = null
      description              = "Allow MSK cluster to receive communication from mskconnect on port 2182 - Zookeeper access"
      from_port                = 2182
      protocol                 = "tcp"
      security_group_id        = module.security_group["msk_sg"].security_group_id
      source_security_group_id = module.security_group["mskconnect_sg"].security_group_id
      to_port                  = 2182
      type                     = "ingress"
    },
    egress_from_kafka_client_instance_to_msk = {
      cidr_blocks              = null
      description              = "Allow Kafka client instance to communicate with MSK node"
      from_port                = -1
      protocol                 = "-1"
      security_group_id        = module.security_group["kafka_client_instance_sg"].security_group_id
      source_security_group_id = module.security_group["msk_sg"].security_group_id
      to_port                  = -1
      type                     = "egress"
    },
    egress_from_mskconnect_to_msk = {
      cidr_blocks              = null
      description              = "Allow mskconnect to communicate with MSK node"
      from_port                = -1
      protocol                 = "-1"
      security_group_id        = module.security_group["mskconnect_sg"].security_group_id
      source_security_group_id = module.security_group["msk_sg"].security_group_id
      to_port                  = -1
      type                     = "egress"
    },
    ingress_from_kafka_client_instance_to_msk_on_port_9094 = {
      cidr_blocks              = null
      description              = "Allow Kafka client instance to communicate with MSK node on port 9094 - TLS Kafka"
      from_port                = 9094
      protocol                 = "tcp"
      security_group_id        = module.security_group["msk_sg"].security_group_id
      source_security_group_id = module.security_group["kafka_client_instance_sg"].security_group_id
      to_port                  = 9094
      type                     = "ingress"
    },
    ingress_from_kafka_client_instance_to_msk_on_port_9098 = {
      cidr_blocks              = null
      description              = "Allow Kafka client instance to communicate with MSK node on port 9098 - IAM Kafka"
      from_port                = 9098
      protocol                 = "tcp"
      security_group_id        = module.security_group["msk_sg"].security_group_id
      source_security_group_id = module.security_group["kafka_client_instance_sg"].security_group_id
      to_port                  = 9098
      type                     = "ingress"
    },
    ingress_from_mskconnect_to_msk_on_port_9098 = {
      cidr_blocks              = null
      description              = "Allow mskconnect to communicate with MSK node on port 9098 - IAM Kafka"
      from_port                = 9098
      protocol                 = "tcp"
      security_group_id        = module.security_group["msk_sg"].security_group_id
      source_security_group_id = module.security_group["mskconnect_sg"].security_group_id
      to_port                  = 9098
      type                     = "ingress"
    },
    kafka_client_instance_to_auroradb_on_port_3306_egress = {
      cidr_blocks              = null
      description              = "Allow Kafka client instance to communicate with Aurora database node on port 3306"
      from_port                = -1
      protocol                 = "-1"
      security_group_id        = module.security_group["kafka_client_instance_sg"].security_group_id
      source_security_group_id = module.security_group["auroradb_sg"].security_group_id
      to_port                  = -1
      type                     = "egress"
    },
    kafka_client_instance_to_auroradb_on_port_3306_ingress = {
      cidr_blocks              = null
      description              = "Allow auroradb to recieve communication from Kafka client instance on port 3306"
      from_port                = 3306
      protocol                 = "tcp"
      security_group_id        = module.security_group["auroradb_sg"].security_group_id
      source_security_group_id = module.security_group["kafka_client_instance_sg"].security_group_id
      to_port                  = 3306
      type                     = "ingress"
    },
    egress_from_mskconnect_to_aurodab = {
      cidr_blocks              = null
      description              = "Allow mskconnect to communicate with auroradb"
      from_port                = -1
      protocol                 = "-1"
      security_group_id        = module.security_group["mskconnect_sg"].security_group_id
      source_security_group_id = module.security_group["auroradb_sg"].security_group_id
      to_port                  = -1
      type                     = "egress"
    },
    msk_sg_to_auroradb_on_port_3306_ingress = {
      cidr_blocks              = null
      description              = "Allow MSK Cluster to communicate with Aurora database node on port 3306"
      from_port                = 3306
      protocol                 = "tcp"
      security_group_id        = module.security_group["auroradb_sg"].security_group_id
      source_security_group_id = module.security_group["msk_sg"].security_group_id
      to_port                  = 3306
      type                     = "ingress"
    },
    mskconnect_to_auroradb_on_port_3306_ingress = {
      cidr_blocks              = null
      description              = "Allow mskconnect to communicate with Aurora database node on port 3306"
      from_port                = 3306
      protocol                 = "tcp"
      security_group_id        = module.security_group["auroradb_sg"].security_group_id
      source_security_group_id = module.security_group["mskconnect_sg"].security_group_id
      to_port                  = 3306
      type                     = "ingress"
    },
    msk_sg_to_auroradb_on_port_3306_egress = {
      cidr_blocks              = null
      description              = "Allow Aurora database to receive communication from MSK Cluster node on port 3306"
      from_port                = -1
      protocol                 = "-1"
      security_group_id        = module.security_group["msk_sg"].security_group_id
      source_security_group_id = module.security_group["auroradb_sg"].security_group_id
      to_port                  = -1
      type                     = "egress"
    },
    auroradb_egress_to_extnet = {
     cidr_blocks              = [ "0.0.0.0/0",]
     description              = "Allow Aurora database node to initiate outbound access to external networks"
     from_port                = 443
     protocol                 = "-1"
     security_group_id        = module.security_group["auroradb_sg"].security_group_id
     source_security_group_id = null
     to_port                  = 443
     type                     = "egress"
    },
  }
  ec2_iam_role_props = {
    ec2_iam_role  = {
      name                          = var.ec2_iam_role
      description                   = "EC2 IAM role trust policy"
      assume_role_policy            = data.template_file.ec2_iam_role_trust_policy.rendered
      path                          = "/"
      tags                          = merge(
        {
          "Name" = format(
            "%s-Ec2IamRole-%s",
            var.name,
            var.environment,
          )
        },
        var.iam_role_tags,
      )
    }
  }
  ec2_iam_role_policy_attachment_props = {
    msk_full_access_policy_attachment = {
      role        = module.ec2_iam_role["ec2_iam_role"].iam_role_name
      policy_arn  = "arn:aws:iam::aws:policy/AmazonMSKFullAccess"
    },
    rds_full_access_policy_attachment = {
      role        = module.ec2_iam_role["ec2_iam_role"].iam_role_name
      policy_arn  = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
    },
    acmpca_full_access_policy_attachment = {
      role        = module.ec2_iam_role["ec2_iam_role"].iam_role_name
      policy_arn  = "arn:aws:iam::aws:policy/AWSCertificateManagerPrivateCAFullAccess"
    },
    ssm_instance_core_policy_attachment = {
      role        = module.ec2_iam_role["ec2_iam_role"].iam_role_name
      policy_arn  = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
    },
    kafka_authorization_iam_policy_attachment = {
      role        = module.ec2_iam_role["ec2_iam_role"].iam_role_name
      policy_arn  = module.kafka_authorization_iam_policy["kafka_authorization_iam_policy"].iam_policy_arn
    },
  }
  kafka_authorization_iam_policy_props = {
    kafka_authorization_iam_policy = {
      name        = var.kafka_authorization_iam_policy_name
      description = "Kafka operations iam policy"
      policy      = data.template_file.kafka_authorization_policy.rendered
      path        = "/"
      tags        = merge(
        {
          "Name" = format(
            "%s-KafkaAuthorizationIamPolicy-%s",
            var.name,
            var.environment,
          )
        },
        var.iam_policy_tags,
      )
    }
  }
  kafka_connect_iam_role_props = {
    kafka_connect_iam_role  = {
      name                          = var.kafka_connect_iam_role
      description                   = "Kafka connect IAM role trust policy"
      assume_role_policy            = data.template_file.kafka_connect_iam_role_trust_policy.rendered
      path                          = "/"
      tags                          = merge(
        {
          "Name" = format(
            "%s-KafkaConnectIamRole-%s",
            var.name,
            var.environment,
          )
        },
        var.iam_role_tags,
      )
    }
  }
  kafka_connect_iam_policy_props = {
    kafka_connect_iam_policy = {
      name        = var.kafka_connect_iam_policy_name
      description = "Kafka connect iam policy"
      policy      = data.template_file.kafka_connect_iam_policy.rendered
      path        = "/"
      tags        = merge(
        {
          "Name" = format(
            "%s-KafkaConnectIamPolicy-%s",
            var.name,
            var.environment,
          )
        },
        var.iam_policy_tags,
      )
    }
  }
  kafka_connect_iam_role_policy_attachment_props = {
    kafka_connect_iam_policy_attachment = {
      role        = module.kafka_connect_iam_role["kafka_connect_iam_role"].iam_role_name
      policy_arn  = module.kafka_connect_iam_policy["kafka_connect_iam_policy"].iam_policy_arn
    },
  }
  key_pair_props = {
    kafka_client_instance = {
      key_name       = "kafka_client_instance-key"
      public_key     = var.kafka_client_instance_public_key
    }
  }
  iam_instance_profile_props = {
    kafka_client_instance = {
      name   = "kafka_client_instance"
      path   = "/"
      role   = module.ec2_iam_role["ec2_iam_role"].iam_role_name
    }
  }
  launch_template_props = {
    lt_latest = {
      default_version                      = "1"
      description                          = "Kafka client instance launch template"
      disable_api_stop                     = false
      disable_api_termination              = false
      ebs_optimized                        = false
      image_id                             = data.aws_ssm_parameter.kafka_client_instance_ami.value
      instance_type                        = "t3.medium"
      key_name                             = module.key_pair["kafka_client_instance"].key_pair_name
      name                                 = "sitadinfra-kafka_client_instance-lt-dev"
      user_data                            = "${base64encode(data.template_file.kafka_client_instance.rendered)}"

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
          arn   =  module.iam_instance_profile["kafka_client_instance"].iam_instance_profile_arn
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
            security_groups = [
              module.security_group["kafka_client_instance_sg"].security_group_id,
            ]
        },
      ]
    }
  }
  kafka_client_instance_props = {
    kafka_client_instance = {
      associate_public_ip_address = true
      availability_zone           = data.aws_availability_zones.available.names[0]
      subnet_id                   = module.public_subnet_1a["public_subnet_1a"].public_subnet_id
      tags                        = {
        name  = "kafkaClientInstance"
        owner = "sitadinfra-dev"
      }
      volume_tags                 = {
        name  = "kafkaClientInstance_vol"
        owner = "sitadinfra-dev" 
      }
      launch_template             = [
        {
           id = module.launch_template["lt_latest"].launch_template_id
        },
      ]
    }
  }
  s3_kafka_connect_target_bucket_props = {
    kafka_connect_target_bucket = {
      bucket = var.s3_kafka_connect_target_bucket_name
      tags                         = merge(
        {
          "Name" = format(
            "sitadinfra-kafka-connect-target-%s",
            var.environment,
          )
        },
        var.s3_bucket_tags,
      )
    }
  }
  s3_object_props = {
    debezium_artifact = {
      bucket = module.kafka_connect_target_bucket["kafka_connect_target_bucket"].s3_bucket_id
      key    = "debezium/"
    },
    salesdb_sql_script = {
      bucket = module.kafka_connect_target_bucket["kafka_connect_target_bucket"].s3_bucket_id
      key    = "scripts/"
    },
  }
  s3_object_file_upload_props = {
    salesdb_sql_script = {
      bucket       = module.kafka_connect_target_bucket["kafka_connect_target_bucket"].s3_bucket_id
      key          = "scripts/salesdb.sql"
      source       = "${path.module}/scripts/salesdb.sql"
      source_hash  = "${filemd5("${path.module}/scripts/salesdb.sql")}"
      content_type = "text/plain"
    },
  }
  s3_vpc_endpoint_props = {
    s3_vpc_endpoint = {
      route_table_ids   = [ module.private_route_table["private_route_table"].private_route_table_id, ]
      service_name      = "com.amazonaws.us-east-1.s3"
      vpc_id            = module.vpc["main_vpc"].vpc_id
      vpc_endpoint_type = "Gateway"
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
  msk_kms_key_props = {
    msk_kms_key = {
      description = "MSK encryption at rest key"
      tags              = {
        owner       = "sitadinfra"
        environment ="DEV"
        name        = "msk_encryption_at_rest_key"
      } 
    }
  }
  msk_broker_log_group_props = {
    msk_broker_logs = {
      name              = "msk_broker_logs"
      retention_in_days = 1
      tags              = {
        owner       = "sitadinfra"
        environment = "DEV"
        name        = "msk_broker_logs"
      } 
    }
  }
  mskconnect_log_group_props = {
    mskconnect_logs = {
      name              = "mskconnect_logs"
      retention_in_days = 1
      tags              = {
        owner       = "sitadinfra"
        environment = "DEV"
        name        = "mskconnect_logs"
      } 
    }
  }
  msk_configuration_props = {
    msk_configuration = {
      description       = "MSK server properties configuration"
      kafka_versions    = ["3.4.0", ]
      name              = "ServerPropertiesFile"
      server_properties = data.template_file.server_properties.rendered
    }
  }
  mskconnect_workers_configuration_props = {
    debezium_mysql_workers_configuration = {
      description             = "Debezium MySql salesdb worker configuration"
      name                    = "DebeziumMysqlWorker"
      properties_file_content = data.template_file.connect_distributed_property_file.rendered
    }
  }
  mskconnect_custom_plugin_props = {
    debezium_mysql_custom_plugin = {
      content_type = "ZIP"
      description  = "Debezium MySql custom plugin" 
      name         = "DebeziumMysqlConnectorPlugin"
      location     = [
        {
           s3 = [
             {
                bucket_arn = module.kafka_connect_target_bucket["kafka_connect_target_bucket"].s3_bucket_arn
                file_key   = "debezium/debezium-connector-mysql-2.3.4.Final-plugin.zip"
             }, 
           ]
        },
      ]
    }
  }  
  mskconnect_props = {
    debezium_mysql_salesdb_connector = {
      connector_configuration = {
        "connector.class": "io.debezium.connector.mysql.MySqlConnector", 
        "tasks.max": "1",
        "database.hostname": module.sales_db_rds_cluster_instance["sales_db_cluster_instance"].rds_cluster_instance_endpoint, 
        "database.port": "3306", 
        "database.user": var.database_user, 
        "database.password": var.database_password, 
        "database.server.id": "184054", 
        "topic.prefix": "salesdb", 
        "database.include.list": "salesdb", 
        "schema.history.internal.kafka.bootstrap.servers": module.msk_cluster["msk_cluster"].msk_cluster_bootstrap_brokers_sasl_iam, 
        "schema.history.internal.kafka.topic": "internal.dbhistory.salesdb", 
        "include.schema.changes": "true",
        "schema.history.internal.consumer.security.protocol": "SASL_SSL",
        "schema.history.internal.consumer.sasl.mechanism": "AWS_MSK_IAM",
        "schema.history.internal.consumer.sasl.jaas.config": "software.amazon.msk.auth.iam.IAMLoginModule required;",
        "schema.history.internal.consumer.sasl.client.callback.handler.class": "software.amazon.msk.auth.iam.IAMClientCallbackHandler",
        "schema.history.internal.producer.security.protocol": "SASL_SSL",
        "schema.history.internal.producer.sasl.mechanism": "AWS_MSK_IAM",
        "schema.history.internal.producer.sasl.jaas.config": "software.amazon.msk.auth.iam.IAMLoginModule required;",
        "schema.history.internal.producer.sasl.client.callback.handler.class": "software.amazon.msk.auth.iam.IAMClientCallbackHandler",
        "topic.creation.default.replication.factor": "-1",
        "topic.creation.default.partitions": "5",
        "topic.creation.default.cleanup.policy": "delete",
        "topic.creation.default.compression.type": "lz4",
      }
      description                = "Debezium Mysql salesdb source connector"
      kafkaconnect_version       = "2.7.1"
      name                       = "debezium-mysql-source-connector"
      service_execution_role_arn = module.kafka_connect_iam_role["kafka_connect_iam_role"].iam_role_arn
      capacity                = [
        {
           provisioned_capacity = [
             {
                mcu_count    = 1
                worker_count = 1
             },
           ]
        },
      ]
      kafka_cluster           = [
        {
           apache_kafka_cluster = [
             {
                bootstrap_servers = module.msk_cluster["msk_cluster"].msk_cluster_bootstrap_brokers_sasl_iam
                vpc               = [
                  {
                     security_groups = [ module.security_group["mskconnect_sg"].security_group_id, ]
                     subnets         = [
                       module.private_subnet_1a["private_subnet_1a"].private_subnet_id,
                       module.private_subnet_1b["private_subnet_1b"].private_subnet_id,
                       module.private_subnet_1c["private_subnet_1c"].private_subnet_id,
                     ] 
                  },
                ]
             },
           ]
        }, 
      ]
      kafka_cluster_client_authentication = [
        {
           authentication_type = "IAM"
        },
      ]
      kafka_cluster_encryption_in_transit = [
        {
           encryption_type = "TLS" 
        },
      ]
      log_delivery                        = [
        {
           worker_log_delivery = [
             {
                cloudwatch_logs = [
                  {
                     enabled   = true
                     log_group = module.mskconnect_log_group["mskconnect_logs"].cloudwatch_log_group_name
                  },
                ]
             },
           ]
        },
      ]
      plugin                             = [
        {
           custom_plugin = [
             {
                arn      = module.debezium_mysql_custom_plugin["debezium_mysql_custom_plugin"].mskconnect_custom_plugin_arn
                revision = module.debezium_mysql_custom_plugin["debezium_mysql_custom_plugin"].mskconnect_custom_plugin_latest_revision
             },
           ]
        },
      ]
      worker_configuration               = [
        {
           arn      = module.debezium_mysql_worker_configuraion["debezium_mysql_workers_configuration"].mskconnect_worker_configuration_arn
           revision = module.debezium_mysql_worker_configuraion["debezium_mysql_workers_configuration"].mskconnect_worker_configuration_latest_revision
        },
      ]
    }
  }
  msk_cluster_props = {
    msk_cluster = {
      cluster_name            = var.msk_cluster_name
      enhanced_monitoring     = "DEFAULT"
      kafka_version           = "3.4.0"
      number_of_broker_nodes  = 3
      tags                    = {
        owner       = "sitadinfra"
        environment = "DEV"
        name        = "sitadinfra-msk-cluster"
      }
      broker_node_group_info  = [
        {
           az_distribution   = "DEFAULT"
           client_subnets    = [
             module.private_subnet_1a["private_subnet_1a"].private_subnet_id,
             module.private_subnet_1b["private_subnet_1b"].private_subnet_id,
             module.private_subnet_1c["private_subnet_1c"].private_subnet_id,
           ]
           instance_type     = "kafka.m5.large"
           security_groups   = [ module.security_group["msk_sg"].security_group_id, ]
           connectivity_info = [
             {
                public_access = [
                  {
                     type = "DISABLED"
                  },
                ]
             },
           ]  
           storage_info      = [
             {
                ebs_storage_info = [
                  {
                     volume_size            = 100
                     provisioned_throughput = [
                       {
                          enabled           = false
                       },
                     ]
                  },
                ]
             }
           ]
        }
      ]
      client_authentication   = [
        {
          unauthenticated = false 
          sasl            = [
            {
              iam = true
            },
          ]
          tls             = [
            {
              certificate_authority_arns = [module.acmpca_ca["acmpca_ca"].acmpca_ca_arn,]
          
            },
          ]
        },
      ]
      configuration_info = [
        {
          arn      = module.msk_configuraion["msk_configuration"].msk_configuration_arn
          revision = module.msk_configuraion["msk_configuration"].msk_configuration_latest_revision
        },
      ]
      encryption_info        = [
        {
          encryption_at_rest_kms_key_arn = module.msk_kms_key["msk_kms_key"].kms_key_arn
          encryption_in_transit          = [
            {
               client_broker = "TLS"
               in_cluster    = true
            },
          ]
        },
      ]
      logging_info           = [
        {
          broker_logs = [
            {
              cloudwatch_logs = [
                {
                  enabled   = true
                  log_group = module.msk_broker_log_group["msk_broker_logs"].cloudwatch_log_group_name
                },
              ]
            },
          ]
        },
      ]
      open_monitoring = [
        {
          prometheus = [
            {
              jmx_exporter = [
                {
                  enabled_in_broker = true          
                },
              ]
            },
          ]
        }
      ]
    }
  }
  db_subnet_group_props = {
    sales_db_subnet_group = {
      name        = "sales-db-subnet-group"
      description = "Sales database subnet group"
      subnet_ids  = [
        module.public_subnet_1b["public_subnet_1b"].public_subnet_id,             
        module.public_subnet_1c["public_subnet_1c"].public_subnet_id,
      ] 
      tags        = {
        environment = "Dev"
        owner       = "sitadinfra"
      }
    }
  }
  db_parameter_group_props = {
    sales_db_parameter_group = {
      name        = "sales-db-parameter-group"
      description = "sales database parameter group"
      family      = "aurora-mysql8.0"
      tags        = {
        environment = "Dev"
        owner       = "sitadinfra"
      } 
      parameter    = [
        {
           name  = "max_connections"
           value = 300
        },
      ]
    }
  }
  rds_cluster_parameter_group_props = {
    sales_db_cluster_parameter_group = {
      description = "Sales database cluster parameter group"
      family      = "aurora-mysql8.0"
      name        = "sales-db-cluster-parameter-group"
      tags        = {
        environment = "Dev"
        owner       = "sitadinfra"
      }
      parameter   = [
        {
           apply_method = "pending-reboot"
           name         = "time_zone"
           value        = "US/Eastern"  
        },
        {
           apply_method = "pending-reboot"
           name         = "binlog_format"
           value        = "ROW"
        },
        {
           apply_method = "pending-reboot"
           name         = "binlog_checksum"
           value        = "NONE"
        },
        {
           apply_method = "pending-reboot"
           name         = "binlog_row_image"
           value        = "FULL"
        },
        {
           apply_method = "pending-reboot"
           name         = "binlog_rows_query_log_events"
           value        = "ON"
        },
      ]
    }
  }
  rds_cluster_props = {
    sales_db_rds_cluster = {
      engine                          = "aurora-mysql"
      master_username                 = var.database_user
      master_password                 = var.database_password
      database_name                   = "salesdb" 
      db_subnet_group_name            = module.sales_db_subnet_group["sales_db_subnet_group"].db_subnet_group_id 
      db_cluster_parameter_group_name = module.sales_db_rds_cluster_parameter_group["sales_db_cluster_parameter_group"].rds_cluster_parameter_group_id
      vpc_security_group_ids          = [
        module.security_group["auroradb_sg"].security_group_id,
      ]
    }
  }
  rds_cluster_instance_props = {
    sales_db_cluster_instance = {
      engine                       = "aurora-mysql"
      cluster_identifier           = module.sales_db_rds_cluster["sales_db_rds_cluster"].rds_cluster_id
      instance_class               = "db.t3.medium"
      db_subnet_group_name         = module.sales_db_subnet_group["sales_db_subnet_group"].db_subnet_group_id
      db_parameter_group_name      = module.sales_db_parameter_group["sales_db_parameter_group"].db_parameter_group_name 
      identifier                   = "salesdb"
      performance_insights_enabled = false
      tags                    = {
        environment = "Dev"
        owner       = "sitadinfra"
      }
    }
  }
  time_sleep_props = {
    sleep_time = {
      create_duration = "5m"
    }
  }
}
