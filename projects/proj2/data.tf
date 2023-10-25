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
data "template_file" "kda_iam_role_trust_policy" {
  template = "${file("${path.module}/policies/kda_iam_role_trust_policy.tpl")}"
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
    aws_region                 = data.aws_region.current.name
    account_id                 = data.aws_caller_identity.current.account_id
    msk_cluster_name           = var.msk_cluster_name
    msk_cluster_uuid           = local.msk_cluster_uuid
    connector_target_bucket    = module.kafka_connect_target_bucket["kafka_connect_target_bucket"].s3_bucket_id
    streaming_artifacts_bucket = module.streaming_artifacts_bucket["streaming_artifacts_bucket"].s3_bucket_id
  }
  depends_on = [ 
    module.msk_cluster,
    module.kafka_connect_target_bucket,
    module.streaming_artifacts_bucket,
  ]
}
data "template_file" "kafka_client_instance" {
  template = "${file("${path.module}/templates/kafka_client_instance.sh")}"
  vars = {
    bootstrapserver_iam        = module.msk_cluster["msk_cluster"].msk_cluster_bootstrap_brokers_sasl_iam
    bootstrapserver_tls        = module.msk_cluster["msk_cluster"].msk_cluster_bootstrap_brokers_tls
    kafka_topic                = "clickstream"
    streaming_artifacts_bucket = module.streaming_artifacts_bucket["streaming_artifacts_bucket"].s3_bucket_id
    ssl_keystore_password      = var.ssl_keystore_password
    ssl_key_password           = var.ssl_key_password
    trust_store_password       = var.trust_store_password
    ossuser                    = "aosadmin"
    osspass                    = var.opensearch_master_user_password
    oss_domain_endpoint        = module.opensearch_service["opensearch_service"].opensearch_domain_endpoint
    kda_role_arn               = module.kda_iam_role["kda_iam_role"].iam_role_arn
  }
  depends_on = [ 
    module.msk_cluster,
    module.streaming_artifacts_bucket,
  ]
}
data "template_file" "server_properties" {
  template = "${file("${path.module}/config/server.properties")}"
  vars = {
  }
}
data "template_file" "opensearch_access_policy" {
  template = "${file("${path.module}/policies/opensearch_access_policy.tpl")}"
  vars = {
    account_id = data.aws_caller_identity.current.account_id
    aws_region = data.aws_region.current.name
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
data "template_file" "clickstream_schema" {
  template = "${file("${path.module}/templates/clickstream_schema.tpl")}"
  vars = {
  }
}
data "aws_opensearch_domain" "clickstream_domain" {
  domain_name = "clickstream"

  depends_on = [ 
    module.opensearch_service,
  ]
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
    kda_sg = {
      name        = "kda_sg"
      description = "KDA security group"
      vpc_id      = module.vpc["main_vpc"].vpc_id
    },
    glue_endpoint_sg = {
      name        = "glue_endpoint_sg"
      description = "Glue endpoint security group"
      vpc_id      = module.vpc["main_vpc"].vpc_id
    },
    s3_endpoint_sg = {
      name        = "s3_endpoint_sg"
      description = "S3 endpoint security group"
      vpc_id      = module.vpc["main_vpc"].vpc_id
    },
    oss_sg = {
      name        = "oss_sg"
      description = "OSS security group"
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
    kafka_client_instance_to_glue_endpoint__egress = {
      cidr_blocks              = null
      description              = "Allow Kafka client instance to communicate with glue endpoint"
      from_port                = -1
      protocol                 = "-1"
      security_group_id        = module.security_group["kafka_client_instance_sg"].security_group_id
      source_security_group_id = module.security_group["glue_endpoint_sg"].security_group_id
      to_port                  = -1
      type                     = "egress"
    },
    kafka_client_instance_to_oss_ingress = {
      cidr_blocks              = null
      description              = "Allow Kafka client instance to communicate with OSS node on port 443"
      from_port                = 443
      protocol                 = "tcp"
      security_group_id        = module.security_group["oss_sg"].security_group_id
      source_security_group_id = module.security_group["kafka_client_instance_sg"].security_group_id
      to_port                  = 443
      type                     = "ingress"
    },
    kafka_client_instance_to_glue_endpoint_ingress = {
      cidr_blocks              = null
      description              = "Allow Kafka client instance to communicate with glue endpoint on port 443"
      from_port                = 443
      protocol                 = "tcp"
      security_group_id        = module.security_group["glue_endpoint_sg"].security_group_id
      source_security_group_id = module.security_group["kafka_client_instance_sg"].security_group_id
      to_port                  = 443
      type                     = "ingress"
    },
    kda_to_glue_endpoint_ingress = {
      cidr_blocks              = null
      description              = "Allow Kinesis Data Analytics to communicate with glue endpoint on port 443"
      from_port                = 443
      protocol                 = "tcp"
      security_group_id        = module.security_group["glue_endpoint_sg"].security_group_id
      source_security_group_id = module.security_group["kda_sg"].security_group_id
      to_port                  = 443
      type                     = "ingress"
    },
    kda_to_oss_ingress = {
      cidr_blocks              = null
      description              = "Allow Kinesis Data Analytics to communicate with OSS node on port 443"
      from_port                = 443
      protocol                 = "tcp"
      security_group_id        = module.security_group["oss_sg"].security_group_id
      source_security_group_id = module.security_group["kda_sg"].security_group_id
      to_port                  = 443
      type                     = "ingress"
    },
    kda_to_oss_egress = {
      cidr_blocks              = null
      description              = "Allow Kinesis Data Analytics to communicate with OSS node"
      from_port                = -1
      protocol                 = "-1"
      security_group_id        = module.security_group["kda_sg"].security_group_id
      source_security_group_id = module.security_group["oss_sg"].security_group_id
      to_port                  = -1
      type                     = "egress"
    },
    kda_to_glue_endpoint__egress = {
      cidr_blocks              = null
      description              = "Allow Kinesis Data Analytics to communicate with glue endpoint"
      from_port                = -1
      protocol                 = "-1"
      security_group_id        = module.security_group["kda_sg"].security_group_id
      source_security_group_id = module.security_group["glue_endpoint_sg"].security_group_id
      to_port                  = -1
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
    kda_to_kafka_client_instance_on_port_8081 = {
      cidr_blocks              = null
      description              = "Allow Kinesis Data Analytics to communicate with Kafka client instance node on port 8081"
      from_port                = 8081
      protocol                 = "tcp"
      security_group_id        = module.security_group["kafka_client_instance_sg"].security_group_id
      source_security_group_id = module.security_group["kda_sg"].security_group_id
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
    egress_from_kafka_client_instance_to_msk_on_port_2182 = {
      cidr_blocks              = null
      description              = "Allow Kafka client instance to communicate with MSK node"
      from_port                = -1
      protocol                 = "-1"
      security_group_id        = module.security_group["kafka_client_instance_sg"].security_group_id
      source_security_group_id = module.security_group["msk_sg"].security_group_id
      to_port                  = -1
      type                     = "egress"
    },
    ingress_from_kda_to_msk_on_port_2182 = {
      cidr_blocks              = null
      description              = "Allow MSK node to recieve communication from Kinesis Data Analytics on port 2182 - Zookeeper access"
      from_port                = 2182
      protocol                 = "tcp"
      security_group_id        = module.security_group["msk_sg"].security_group_id
      source_security_group_id = module.security_group["kda_sg"].security_group_id
      to_port                  = 2182
      type                     = "ingress"
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
    ingress_from_kda_to_msk_on_port_9094 = {
      cidr_blocks              = null
      description              = "Allow Kinesis Data Analytics to communicate with MSK node on port 9094 - TLS Kafka"
      from_port                = 9094
      protocol                 = "tcp"
      security_group_id        = module.security_group["msk_sg"].security_group_id
      source_security_group_id = module.security_group["kda_sg"].security_group_id
      to_port                  = 9094
      type                     = "ingress"
    },
    egress_from_kda_to_msk_on_port_9094 = {
      cidr_blocks              = null
      description              = "Allow Kinesis Data Analytics to communicate with MSK Node"
      from_port                = -1
      protocol                 = "-1"
      security_group_id        = module.security_group["kda_sg"].security_group_id
      source_security_group_id = module.security_group["msk_sg"].security_group_id
      to_port                  = -1
      type                     = "egress"
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
    ingress_from_kda_to_msk_on_port_9098 = {
      cidr_blocks              = null
      description              = "Allow Kinesis Data Analytics to communicate with MSK node on port 9098 - IAM Kafka"
      from_port                = 9098
      protocol                 = "tcp"
      security_group_id        = module.security_group["msk_sg"].security_group_id
      source_security_group_id = module.security_group["kda_sg"].security_group_id
      to_port                  = 9098
      type                     = "ingress"
    },
    ingress_from_kafka_client_instance_to_msk_monitoring = {
      cidr_blocks              = null
      description              = "Allow kafka client instance to communicate with MSK node on port 11001-11002 to monitor Kafka service"
      from_port                = 11001
      protocol                 = "tcp"
      security_group_id        = module.security_group["msk_sg"].security_group_id
      source_security_group_id = module.security_group["kafka_client_instance_sg"].security_group_id
      to_port                  = 11002
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
    kda_full_access_policy_attachment = {
      role        = module.ec2_iam_role["ec2_iam_role"].iam_role_name
      policy_arn  = "arn:aws:iam::aws:policy/AmazonKinesisAnalyticsFullAccess"
    },
    glue_schema_registry_full_access_policy_attachment = {
      role        = module.ec2_iam_role["ec2_iam_role"].iam_role_name
      policy_arn  = "arn:aws:iam::aws:policy/AWSGlueSchemaRegistryFullAccess"
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
  kda_iam_role_props = {
    kda_iam_role = {
      name                          = var.kda_iam_role
      description                   = "KDA IAM role trust policy"
      assume_role_policy            = data.template_file.kda_iam_role_trust_policy.rendered
      path                          = "/"
      tags                          = merge(
        {
          "Name" = format(
            "%s-kdaIamRole-%s",
            var.name,
            var.environment,
          )
        },
        var.iam_role_tags,
      )
    }
  }
  kda_iam_role_policy_attachment_props = {
    msk_full_access_policy_attachment = {
      role        = module.kda_iam_role["kda_iam_role"].iam_role_name
      policy_arn  = "arn:aws:iam::aws:policy/AmazonMSKFullAccess"
    },
    s3_full_access_policy_attachment = {
      role        = module.kda_iam_role["kda_iam_role"].iam_role_name
      policy_arn  = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
    },
    vpc_full_access_policy_attachment = {
      role        = module.kda_iam_role["kda_iam_role"].iam_role_name
      policy_arn  = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
    },
    cloudwatch_full_access_policy_attachment = {
      role        = module.kda_iam_role["kda_iam_role"].iam_role_name
      policy_arn  = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
    },
    oss_full_access_policy_attachment = {
      role        = module.kda_iam_role["kda_iam_role"].iam_role_name
      policy_arn  = "arn:aws:iam::aws:policy/AmazonOpenSearchServiceFullAccess"
    },
    glue_schema_registry_full_access_policy_attachment = {
      role        = module.kda_iam_role["kda_iam_role"].iam_role_name
      policy_arn  = "arn:aws:iam::aws:policy/AWSGlueSchemaRegistryFullAccess"
    },
    kafka_authorization_iam_policy_attachment = {
      role        = module.kda_iam_role["kda_iam_role"].iam_role_name
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
  s3_streaming_artifacts_bucket_props = {
    streaming_artifacts_bucket = {
      bucket = var.s3_streaming_artifacts_bucket_name
      tags                         = merge(
        {
          "Name" = format(
            "sitadinfra-streaming-artifacts-%s",
            var.environment,
          )
        },
        var.s3_bucket_tags,
      )
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
    msk_lab_resources = {
      bucket = module.streaming_artifacts_bucket["streaming_artifacts_bucket"].s3_bucket_id
      key    = "msk-lab-resources/"
    },
    msk_lab_resources_flink = {
      bucket = module.streaming_artifacts_bucket["streaming_artifacts_bucket"].s3_bucket_id
      key    = "msk-lab-resources/Flink/"
    },
  }
  s3_object_file_upload_props = {
    departments_count = {
      bucket       = module.streaming_artifacts_bucket["streaming_artifacts_bucket"].s3_bucket_id
      key          = "msk-lab-resources/departments_count.json"
      source       = "${path.module}/config/departments_count.json"
      source_hash  = "${filemd5("${path.module}/config/departments_count.json")}"
      content_type = "text/plain"
    },
    user_session_counts = {
      bucket       = module.streaming_artifacts_bucket["streaming_artifacts_bucket"].s3_bucket_id
      key          = "msk-lab-resources/user_session_counts.json"
      source       = "${path.module}/config/user_session_counts.json"
      source_hash  = "${filemd5("${path.module}/config/user_session_counts.json")}"
      content_type = "text/plain"
    },
    user_session_details = {
      bucket       = module.streaming_artifacts_bucket["streaming_artifacts_bucket"].s3_bucket_id
      key          = "msk-lab-resources/user_session_details.json"
      source       = "${path.module}/config/user_session_details.json"
      source_hash  = "${filemd5("${path.module}/config/user_session_details.json")}"
      content_type = "text/plain"
    },
    clickstream_dashboard = {
      bucket       = module.streaming_artifacts_bucket["streaming_artifacts_bucket"].s3_bucket_id
      key          = "msk-lab-resources/clickstream_dashboard.ndjson"
      source       = "${path.module}/config/clickstream_dashboard.ndjson"
      source_hash  = "${filemd5("${path.module}/config/clickstream_dashboard.ndjson")}"
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
  glue_vpc_endpoint_props = {
    glue_vpc_endpoint = {
      ip_address_type     = "ipv4"
      private_dns_enabled = true
      security_group_id   = [ module.security_group["glue_endpoint_sg"].security_group_id, ]
      service_name        = "com.amazonaws.us-east-1.glue"
      subnet_ids          = [
        module.private_subnet_1a["private_subnet_1a"].private_subnet_id,
        module.private_subnet_1b["private_subnet_1b"].private_subnet_id,
        module.private_subnet_1c["private_subnet_1c"].private_subnet_id,
      ]
      vpc_id            = module.vpc["main_vpc"].vpc_id
      vpc_endpoint_type = "Interface"
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
  msk_configuration_props = {
    msk_configuration = {
      description       = "MSK server properties configuration"
      kafka_versions    = ["3.4.0", ]
      name              = "ServerPropertiesFile"
      server_properties = data.template_file.server_properties.rendered
    }
  }
  msk_cluster_uuid = element(concat(split("/",element(concat(split(":",data.aws_msk_cluster.msk_cluster.arn), [""]), 5)), [""]), 2)
  
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
  opensearch_service_vpc_endpoint_props = {
    opensearch_service_vpc_endpoint = {
      domain_arn  = module.opensearch_service["opensearch_service"].opensearch_domain_arn
      vpc_options = [
        {
          security_group_ids = [ module.security_group["oss_sg"].security_group_id, ]
          subnet_ids         = [ module.private_subnet_1a["private_subnet_1a"].private_subnet_id, ]
        },
      ]
    }
  }
  opensearch_service_props = {
    opensearch_service = {
      access_policies           = data.template_file.opensearch_access_policy.rendered
      domain_name               = "clickstream"
      engine_version            = "OpenSearch_1.3"
      advanced_security_options = [
        {
           enabled                        = true
           internal_user_database_enabled = true
           master_user_options            = [
             {
                master_user_name     = "aosadmin"
                master_user_password = var.opensearch_master_user_password
             }, 
           ]
        },
      ]
      cluster_config   = [
        {
          instance_count = 1
          instance_type  = "t3.medium.search"

        },
      ]
      domain_endpoint_options = [
        {
          enforce_https       = true
          tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
        },
      ]
      ebs_options = [
        {
          ebs_enabled = true
          volume_size = 10
          volume_type = "gp2"
        },
      ]
      encrypt_at_rest = [
        {
          enabled = true
        },
      ]
      node_to_node_encryption = [
        {
           enabled = true
        },
      ]
      vpc_options = [
        {
          security_group_ids = [ module.security_group["oss_sg"].security_group_id, ]
          subnet_ids         = [ module.private_subnet_1a["private_subnet_1a"].private_subnet_id, ]
        },
      ]
    }
  }
  kda_cloudwatch_log_group_props = {
    clickstream_cloudwatch_log_group = {
      name              = "clickstream_log_group"
      retention_in_days = 1
      tags              = {
        owner       = "sitadinfra"
        environment = "DEV"
        name        = "clickstream_log_group"
      } 
    }
  }
  kda_cloudwatch_log_stream_props = {
    clickstream_log_stream = {
      log_group_name = module.kda_cloudwatch_log_group["clickstream_cloudwatch_log_group"].cloudwatch_log_group_name
      name           = "clickstream_stream_logs"
    }
  }
  clickstream_registry_props = {
    clickstream_registry = {
      description   = "Click Stream registry"
      registry_name = "clickstream"
    }
  }
  clickstream_schema_props = {
    clickstream_schema = {
      compatibility     = "FULL"
      data_format       = "AVRO"
      description       = "Clickstream schema"
      registry_arn      = module.clickstream_registry["clickstream_registry"].glue_registry_arn
      schema_name       = "clickstream"
      schema_definition = data.template_file.clickstream_schema.rendered
    }
  }
  kinesisanalyticsv2_application_props = {
    kinesisanalyticsv2_application = {
      description               = "KDA Flink App to analyze Clicktream data from MSK"
      name                      = "KDAFlinkClickstream"
      runtime_environment       = "FLINK-1_13"
      service_execution_role    = module.kda_iam_role["kda_iam_role"].iam_role_arn
      application_configuration = [
        {
           application_code_configuration = [
             {
                code_content_type = "ZIPFILE"
                code_content      = [
                  {
                     s3_content_location = [
                       {
                          bucket_arn = module.streaming_artifacts_bucket["streaming_artifacts_bucket"].s3_bucket_arn
                          file_key   = "msk-lab-resources/Flink/ClickstreamProcessor-1.0.jar"
                       },
                     ]
                  },
                ]
             },
           ]
           application_snapshot_configuration = [
             {
                snapshots_enabled = false
             },
           ]
           environment_properties             = [
             {
                property_group = [
                  {
                     property_group_id = "FlinkApplicationProperties"
                     property_map      = {
                       "OpenSearchEndpoint"                            = "https://${data.aws_opensearch_domain.clickstream_domain.endpoint}:443",
                       "Region"                                        = data.aws_region.current.name,
                       "BootstrapServers"                              = module.msk_cluster["msk_cluster"].msk_cluster_bootstrap_brokers_sasl_iam,
                       "GroupId"                                       = "flink-clickstream-processor",
                       "ZookeeperConnect"                              = module.msk_cluster["msk_cluster"].msk_cluster_zookeeper_connect_string,
                       "COMPATIBILITY_SETTING"                         = "Compatibility.FULL",
                       "DATA_FORMAT"                                   = "AVRO",
                       "REGISTRY_NAME"                                 = "clickstream",
                       "SCHEMA_AUTO_REGISTRATION_SETTING"              = true,
                       "SCHEMA_NAME"                                   = "clickstream",
                       "Topic"                                         = "clickstream",
                       "DepartmentsAgg_Topic"                          = "Departments_Agg",
                       "clickEventsUserIdAggResult_Topic"              = "ClickEvents_UserId_Agg_Result",
                       "userSessionsAggregatesWithOrderCheckout_Topic" = "User_Sessions_Aggregates_With_Order_Checkout"
                     }
                  },
                ]
             },
           ]
           flink_application_configuration = [
             {
                monitoring_configuration = [
                  {
                     configuration_type = "CUSTOM"
                     log_level          = "WARN"
                     metrics_level      = "OPERATOR"
                  },
                ]
                parallelism_configuration = [
                  {
                     auto_scaling_enabled = true
                     configuration_type   = "CUSTOM"
                     parallelism          = 16
                     parallelism_per_kpu  = 2
                  },
                ]
             },
           ]
           vpc_configuration = [
             {
                security_group_ids = [ 
                  module.security_group["kda_sg"].security_group_id,
                ]
                subnet_ids         = [
                  module.private_subnet_1a["private_subnet_1a"].private_subnet_id,
                  module.private_subnet_1b["private_subnet_1b"].private_subnet_id,
                  module.private_subnet_1c["private_subnet_1c"].private_subnet_id
                ]
             },
           ]
        },
      ]
      application_cloudwatch_logging_options = [
        {
          log_stream_arn = module.kda_cloudwatch_log_stream["clickstream_log_stream"].cloudwatch_log_stream_arn 
        },
      ]
    }
  }
  time_sleep_props = {
    sleep_time = {
      create_duration = "20m"
    }
  }
}
