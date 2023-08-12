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
data "aws_s3_bucket" "athena_query_result_bucket" {
  bucket = module.athena_query_result_s3_bucket["athena_query_result_bucket"].s3_bucket_id
  depends_on = [ module.athena_query_result_s3_bucket ]
}
data "aws_s3_bucket" "s3_assets_bucket" {
  bucket = module.s3_assets_bucket["assets_bucket"].s3_bucket_id
  depends_on = [ module.s3_assets_bucket ]
}
data "template_file" "glue_service_assume_role" {
  template = "${file("${path.module}/policies/glue_service_assume_role.tpl")}"
  vars = {
  }
}
data "template_file" "glue_service_notebook_assume_role" {
  template = "${file("${path.module}/policies/glue_service_notebook_assume_role.tpl")}"
  vars = {
  }
}
data "template_file" "sagemaker_notebook_assume_role" {
  template = "${file("${path.module}/policies/sagemaker_notebook_assume_role.tpl")}"
  vars = {
  }
}
data "template_file" "lambda_glue_notebook_service_assume_role" {
  template = "${file("${path.module}/policies/lambda_glue_notebook_service_assume_role.tpl")}"
  vars = {
  }
}
data "template_file" "lambda_service_policy" {
  template = "${file("${path.module}/policies/lambda_service_policy.tpl")}"
  vars = {
  }
}
data "template_file" "gsw-stream-glue-schema" {
  template = "${file("${path.module}/templates/gsw-stream-glue-schema.tpl")}"
  vars = {
  }
}
data "template_file" "product_data_csv" {
  template = "${file("${path.module}/code_files/product_data.csv")}"
  vars = {
  }
}
data "template_file" "data_generator_py" {
  template = "${file("${path.module}/code_files/data_generator.py")}"
  vars = {
  }
}
data "template_file" "create_iceberg_tables_py" {
  template = "${file("${path.module}/code_files/create_iceberg_tables.py")}"
  vars = {
  }
}
data "template_file" "gsw_transform_py" {
  template = "${file("${path.module}/code_files/gsw_transform.py")}"
  vars = {
  }
}
data "template_file" "populate_transactions_history_json" {
  template = "${file("${path.module}/code_files/populate_transactions_history.json")}"
  vars = {
  }
}
data "template_file" "populate_transactions_history_py" {
  template = "${file("${path.module}/code_files/populate_transactions_history.py")}"
  vars = {
  }
}
data "archive_file" "create_product_details_table" {
  type             = "zip"
  source_file      = "${path.module}/code_files/create_product_details_table/create_product_details_table.py"
  output_file_mode = "0644"
  output_path      = "${path.module}/code_files/create_product_details_table.py.zip"
}



locals {
  
  kinesis_stream_props = {
    gsw = {
      name             = var.kinesis_stream_name
      retention_period = 24
      shard_count      = 1 
      tags                 = merge(
        {
          "Name" = format(
            "gsw_stream-%s",
            var.environment,
          )
        },
        var.kinesis_stream_tags,
      )
    }
  }
  athena_query_result_s3_bucket_props = {
    athena_query_result_bucket = {
      bucket = var.athena_query_result_s3_bucket_name
      tags                         = merge(
        {
          "Name" = format(
            "aws-glue-${data.aws_caller_identity.current.account_id}-%s",
            var.environment,
          )
        },
        var.s3_bucket_tags,
      )
    }
  }
  s3_assets_bucket_props = {
    assets_bucket = {
      bucket = var.s3_assets_bucket_name
      tags                         = merge(
        {
          "Name" = format(
            "aws-glue-assets-${data.aws_caller_identity.current.account_id}-%s",
            var.environment,
          )
        },
        var.s3_bucket_tags,
      )
    }
  }
  glue_service_iam_role_props = {
    glue_service_iam_role = {
      name                         = var.glue_service_iam_role_name
      description                  = "Glue service assume role"
      assume_role_policy           = data.template_file.glue_service_assume_role.rendered
      path                         = "/"
      tags                         = merge(
        {
          "Name" = format(
            "AWSGlueServiceRole-%s-%s",
            var.name,
            var.environment,
          )
        },
        var.iam_role_tags,
      )
    }
  }
  glue_service_iam_policy_attachment_props = {
    glue_service_role_policy_attachment = {
      role       = module.glue_service_iam_role["glue_service_iam_role"].iam_role_name
      policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
    },
    s3_full_access_policy_attachment = {
      role       = module.glue_service_iam_role["glue_service_iam_role"].iam_role_name
      policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
    },
    dynamodb_full_access_policy_attachment = {
      role       = module.glue_service_iam_role["glue_service_iam_role"].iam_role_name
      policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
    },
    kinesis_full_access_policy_attachment = {
      role       = module.glue_service_iam_role["glue_service_iam_role"].iam_role_name
      policy_arn = "arn:aws:iam::aws:policy/AmazonKinesisFullAccess"
    },
    sns_full_access_policy_attachment = {
      role       = module.glue_service_iam_role["glue_service_iam_role"].iam_role_name
      policy_arn = "arn:aws:iam::aws:policy/AmazonSNSFullAccess"
    },
    sqs_full_access_policy_attachment = {
      role       = module.glue_service_iam_role["glue_service_iam_role"].iam_role_name
      policy_arn = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
    }
  }
  glue_developer_iam_group_props = {
    glue_developer_iam_group = {
      name = var.glue_developer_iam_group_name
      path = "/"
    }
  }
  glue_developer_iam_group_policy_attachment_props = {
    glue_console_full_access_policy_attachment = {
      group      = module.glue_developer_iam_group["glue_developer_iam_group"].iam_group_name
      policy_arn = "arn:aws:iam::aws:policy/AWSGlueConsoleFullAccess"
    },
    glue_console_sagemakernotebook_full_access_policy_attachment = {
      group      = module.glue_developer_iam_group["glue_developer_iam_group"].iam_group_name
      policy_arn = "arn:aws:iam::aws:policy/AWSGlueConsoleSageMakerNotebookFullAccess"
    },
    glue_schema_registry_full_access_policy_attachment = {
      group      = module.glue_developer_iam_group["glue_developer_iam_group"].iam_group_name
      policy_arn = "arn:aws:iam::aws:policy/AWSGlueSchemaRegistryFullAccess"
    },
    cloudwatch_logs_readonly_access_policy_attachment = {
      group      = module.glue_developer_iam_group["glue_developer_iam_group"].iam_group_name
      policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsReadOnlyAccess"
    },
    athena_full_access_policy_attachment = {
      group      = module.glue_developer_iam_group["glue_developer_iam_group"].iam_group_name
      policy_arn = "arn:aws:iam::aws:policy/AmazonAthenaFullAccess"
    }
  }
  glue_service_notebook_iam_role_props = {
    glue_service_notebook_iam_role = {
      name                         = var.glue_service_notebook_iam_role_name
      description                  = "Glue service notebook assume role"
      assume_role_policy           = data.template_file.glue_service_notebook_assume_role.rendered
      path                         = "/"
      tags                         = merge(
        {
          "Name" = format(
            "AWSGlueServiceNotebookRole-%s-%s",
            var.name,
            var.environment,
          )
        },
        var.iam_role_tags,
      )
    }
  }
  glue_service_notebook_iam_policy_attachment_props = {
    glue_service_notebook_role_policy_attachment = {
      role       = module.glue_service_notebook_iam_role["glue_service_notebook_iam_role"].iam_role_name
      policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceNotebookRole"
    },
    s3_full_access_policy_attachment = {
      role       = module.glue_service_notebook_iam_role["glue_service_notebook_iam_role"].iam_role_name
      policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
    }
  }
  sagemaker_notebook_iam_role_props = {
    sagemaker_notebook_iam_role = {
      name                         = var.sagemaker_notebook_iam_role_name
      description                  = "Sagemaker notebook assume role"
      assume_role_policy           = data.template_file.sagemaker_notebook_assume_role.rendered
      path                         = "/"
      tags                         = merge(
        {
          "Name" = format(
            "AWSGlueServiceSageMakerNotebookRole-%s-%s",
            var.name,
            var.environment,
          )
        },
        var.iam_role_tags,
      )
    }
  }
  sagemaker_notebook_iam_policy_attachment_props = {
    sagemaker_full_access_policy_attachment = {
      role       = module.sagemaker_notebook_iam_role["sagemaker_notebook_iam_role"].iam_role_name
      policy_arn = "arn:aws:iam::aws:policy/AmazonSageMakerFullAccess"
    },
    s3_full_access_policy_attachment = {
      role       = module.sagemaker_notebook_iam_role["sagemaker_notebook_iam_role"].iam_role_name
      policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
    },
    cloudwatch_logs_full_access_policy_attachment = {
      role       = module.sagemaker_notebook_iam_role["sagemaker_notebook_iam_role"].iam_role_name
      policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
    },
    glue_service_notebook_role_policy_attachment = {
      role       = module.sagemaker_notebook_iam_role["sagemaker_notebook_iam_role"].iam_role_name
      policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceNotebookRole"
    }
  }
  athena_workgroup_props = {
    athena_adhoc_query_workgroup = {
      description   = "ad hoc query work group"
      name          = var.athena_workgroup_name
      state         = "ENABLED"
      configuration = [
        {
          enforce_workgroup_configuration    = true
          execution_role                     = module.glue_service_notebook_iam_role["glue_service_notebook_iam_role"].iam_role_arn
          publish_cloudwatch_metrics_enabled = false 
          engine_version                     = [
            {
              selected_engine_version = "Athena engine version 3"     
            },
          ]
          result_configuration               = [
            {
              output_location   = "s3://${data.aws_s3_bucket.athena_query_result_bucket.id}/athena_results/"
              acl_configuration = [
                {
                  s3_acl_option = "BUCKET_OWNER_FULL_CONTROL"
                },
              ]
              encryption_configuration = [
                {
                  encryption_option = "SSE_S3"
                },
              ]
            },
          ]
        },
      ] 
    }
  }
  s3_object_props = {
    code = {
      bucket = module.athena_query_result_s3_bucket["athena_query_result_bucket"].s3_bucket_id 
      key    = "code/"
    },
    spark_ui = {
      bucket = module.athena_query_result_s3_bucket["athena_query_result_bucket"].s3_bucket_id
      key    = "spark_ui/"
    },
    athena_results = {
      bucket = module.athena_query_result_s3_bucket["athena_query_result_bucket"].s3_bucket_id
      key    = "athena_results/"
    },
    temp = {
      bucket = module.athena_query_result_s3_bucket["athena_query_result_bucket"].s3_bucket_id
      key    = "temp/"
    },
    outputs = {
      bucket = module.athena_query_result_s3_bucket["athena_query_result_bucket"].s3_bucket_id
      key    = "outputs/"
    },
    data = {
      bucket = module.athena_query_result_s3_bucket["athena_query_result_bucket"].s3_bucket_id
      key    = "data/"
    },
    data_product_data = {
      bucket = module.athena_query_result_s3_bucket["athena_query_result_bucket"].s3_bucket_id
      key    = "data/product_data/"
    },
    libs = {
      bucket = module.athena_query_result_s3_bucket["athena_query_result_bucket"].s3_bucket_id
      key    = "libs/"
    },
    warehouse_path = {
      bucket = module.athena_query_result_s3_bucket["athena_query_result_bucket"].s3_bucket_id
      key    = "warehouse_path/"
    },
    database_path = {
      bucket = module.athena_query_result_s3_bucket["athena_query_result_bucket"].s3_bucket_id
      key    = "database_path/"
    },
    table_path = {
      bucket = module.athena_query_result_s3_bucket["athena_query_result_bucket"].s3_bucket_id
      key    = "table_path/" 
    },
    database_path_gsw_iceberg = {
      bucket = module.athena_query_result_s3_bucket["athena_query_result_bucket"].s3_bucket_id
      key    = "database_path/gsw_iceberg/"
    },
    transforms = {
      bucket = module.s3_assets_bucket["assets_bucket"].s3_bucket_id
      key    = "transforms/"
    },
    scripts = {
      bucket = module.s3_assets_bucket["assets_bucket"].s3_bucket_id
      key    = "scripts/"
    },
    sparkHistoryLogs = {
      bucket = module.s3_assets_bucket["assets_bucket"].s3_bucket_id
      key    = "sparkHistoryLogs/"
    },
    warehouse_path_asset_bucket = {
      bucket = module.s3_assets_bucket["assets_bucket"].s3_bucket_id
      key    = "warehouse_path/"
    },
    temporary = {
      bucket = module.s3_assets_bucket["assets_bucket"].s3_bucket_id
      key    = "temporary/"
    }
  }
  s3_object_file_upload_props = {
    product_data = {
      bucket       = module.athena_query_result_s3_bucket["athena_query_result_bucket"].s3_bucket_id
      key          = "data/product_data/product_data.csv"
      content      = data.template_file.product_data_csv.rendered
      content_type = "text/plain"
    },
    data_generator = {
      bucket       = module.athena_query_result_s3_bucket["athena_query_result_bucket"].s3_bucket_id
      key          = "code/data_generator.py"
      content      = data.template_file.data_generator_py.rendered
      content_type = "text/x-python"
    },
    create_iceberg_tables = {
      bucket       = module.athena_query_result_s3_bucket["athena_query_result_bucket"].s3_bucket_id
      key          = "code/create_iceberg_tables.py"
      content      = data.template_file.create_iceberg_tables_py.rendered
      content_type = "text/x-python"
    },
    stream_transform = {
      bucket       = module.s3_assets_bucket["assets_bucket"].s3_bucket_id
      key          = "scripts/gsw_transform.py"
      content      = data.template_file.gsw_transform_py.rendered
      content_type = "text/x-python"
    },
    populate_transactions_history_json = {
      bucket = module.s3_assets_bucket["assets_bucket"].s3_bucket_id
      key    = "transforms/populate_transactions_history.json"
      content      = data.template_file.populate_transactions_history_json.rendered
      content_type = "text/plain"
    },
    populate_transactions_history_py = {
      bucket = module.s3_assets_bucket["assets_bucket"].s3_bucket_id
      key    = "transforms/populate_transactions_history.py"
      content      = data.template_file.populate_transactions_history_py.rendered
      content_type = "text/x-python"
    }
  }
  s3_object_zipfile_upload_props = {
    create_product_details_table = {
      bucket       = module.athena_query_result_s3_bucket["athena_query_result_bucket"].s3_bucket_id
      key          = "code/create_product_details_table.py.zip"
      source       = data.archive_file.create_product_details_table.output_path
      content_type = "application/zip"
    },
  }
  gsw_iceberg_catalog_database_props = {
    gsw_iceberg_catalog_database = {
      description   = "GSW Iceberg database"
      location_uri  = "s3://${data.aws_s3_bucket.athena_query_result_bucket.id}/database_path/gsw_iceberg"
      name          = "gsw_iceberg"
    }
  }  
  gsw_stream_registry_props = {
    gsw_stream_registry = {
      description   = "GSW Stream registry"
      registry_name = "gsw-stream-registry"
    }
  }
  gsw_stream_schema_props = {
    gsw_stream_schema = {
      compatibility     = "BACKWARD_ALL"
      data_format       = "AVRO"
      description       = "GSW Stream schema"
      registry_arn      = module.gsw_stream_registry["gsw_stream_registry"].glue_registry_arn
      schema_name       = "gsw-stream-schema"
      schema_definition = data.template_file.gsw-stream-glue-schema.rendered
    }
  }
  gsw_stream_registry_table_props = {
    gsw_stream_registry_table = {
      description        = "GSW Stream registry table"
      database_name      = module.gsw_iceberg_catalog_database["gsw_iceberg_catalog_database"].glue_catalog_database_id
      name               = "registry_table_gsw_stream"
      storage_descriptor = [
        {
          location         = module.kinesis_stream["gsw"].kinesis_stream_name
          schema_reference = [
            {
               schema_version_number = 1
               schema_id             = [
                 {
                   schema_arn    = module.gsw_stream_schema["gsw_stream_schema"].glue_schema_arn
                 },
               ]
            },
          ]
        },
      ]
    }
  }
  gsw_stream_table_props = {
    gsw_stream_table = {
      description        = "GSW Stream table"
      database_name      = module.gsw_iceberg_catalog_database["gsw_iceberg_catalog_database"].glue_catalog_database_id
      name               = "gsw_stream"
      parameters         = {
        "classification" = "json"
      }
      retention          = 0
      table_type         = "EXTERNAL_TABLE"
      storage_descriptor = [
        {
           input_format              = "org.apache.hadoop.mapred.TextInputFormat"
           output_format             = "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat"
           compressed                = false
           number_of_buckets         = 0
           location                  = module.kinesis_stream["gsw"].kinesis_stream_name
           stored_as_sub_directories = false
           parameters                = {
             "streamARN"  = module.kinesis_stream["gsw"].kinesis_stream_arn,
             "typeOfData" = "kinesis"
           }
           columns           = [
             {
                "name" = "order_id",
                "type" = "string"
             },
             {
                "name" = "product_id",
                "type" = "string"
             },
             {
                "name" = "event_time",
                "type" = "timestamp"
             },
             {
                "name" = "promotion_code",
                "type" = "string"
             },
             {
                "name" = "product_price",
                "type" = "float"
             },
             {
                "name" = "quantity",
                "type" = "int"
             },
             {
                "name" = "purchase_price",
                "type" =  "float"
             }
           ]
           ser_de_info       = [
             {
                serialization_library = "org.openx.data.jsonserde.JsonSerDe"
             }
           ]
        },
      ]
    }
  }
  gsw_datagenerator_job_props = {
    gsw_datagenerator_job = {
      default_arguments = {
        "--TempDir"     = "s3://${data.aws_s3_bucket.athena_query_result_bucket.id}/temp/"
        "--STREAM_NAME" = "gsw_stream-dev"
      }
      description       = "GSW datagenerator job"
      execution_class   = "STANDARD"
      glue_version      = "3.0"
      name              = "gsw_datagenerator"
      #number_of_workers = 2
      role_arn          = module.glue_service_iam_role["glue_service_iam_role"].iam_role_arn
      #worker_type       = "G.1X"
      command           = [
        {
           name            = "pythonshell"
           script_location = "s3://${data.aws_s3_bucket.athena_query_result_bucket.id}/code/data_generator.py"
           python_version  = "3.9"
        },
      ]
    }
  }
  gsw_create_iceberg_tables_job_props = {
    gsw_create_iceberg_tables_job = {
      default_arguments = {
        "--TBL_BASE_PATH"                    = "s3://${data.aws_s3_bucket.athena_query_result_bucket.id}/table_path/"
        "--enable-glue-datacatalog"          = true
        "--job-bookmark-option"              = "job-bookmark-disable"
        "--datalake-formats"                 = "iceberg"
        "--TempDir"                          = "s3://${data.aws_s3_bucket.athena_query_result_bucket.id}/temp/"
        "--DB_NAME"                          = "gsw_iceberg"
        "--enable-metrics"                   = true
        "--enable-spark-ui"                  = true
        "--spark-event-logs-path"            = "s3://${data.aws_s3_bucket.athena_query_result_bucket.id}/spark_ui/"
        "--enable-job-insights"              = true
        "--enable-continuous-cloudwatch-log" = true
        "--job-language"                     = "python"
        "--conf"                             = "spark.sql.extensions=org.apache.iceberg.spark.extensions.IcebergSparkSessionExtensions  --conf spark.sql.catalog.gsw_catalog=org.apache.iceberg.spark.SparkCatalog  --conf spark.sql.catalog.gsw_catalog.warehouse=\"s3://${data.aws_s3_bucket.athena_query_result_bucket.id}/warehouse_path/\"  --conf spark.sql.catalog.gsw_catalog.catalog-impl=org.apache.iceberg.aws.glue.GlueCatalog  --conf spark.sql.catalog.gsw_catalog.io-impl=org.apache.iceberg.aws.s3.S3FileIO"
      }
      description       = "GSW create iceberg tables job"
      execution_class   = "FLEX"
      glue_version      = "3.0"
      name              = "gsw_create_iceberg_tables"
      number_of_workers = 2
      role_arn          = module.glue_service_iam_role["glue_service_iam_role"].iam_role_arn
      worker_type       = "G.1X"
      command           = [
        {
           name            = "glueetl"
           script_location = "s3://${data.aws_s3_bucket.athena_query_result_bucket.id}/code/create_iceberg_tables.py"
           python_version  = "3"
        },
      ]
    }
  }
  gsw_transform_job_props = {
    gsw_transform_job = {
      default_arguments = {
        "--JOB_NAME"                         = "gsw_transform.py"
        "--job-bookmark-option"              = "job-bookmark-disable"
        "--datalake-formats"                 = "iceberg"
        "--TempDir"                          = "s3://${data.aws_s3_bucket.s3_assets_bucket.id}/temporary/"
        "--enable-metrics"                   = true
        "--enable-spark-ui"                  = true
        "--spark-event-logs-path"            = "s3://${data.aws_s3_bucket.s3_assets_bucket.id}/sparkHistoryLogs/"
        "--enable-job-insights"              = true
        "--enable-continuous-cloudwatch-log" = true
        "--job-language"                     = "python"
        "--extra-py-files"                   = "s3://${data.aws_s3_bucket.s3_assets_bucket.id}/transforms/populate_transactions_history.py"
        "--conf"                             = "spark.sql.extensions=org.apache.iceberg.spark.extensions.IcebergSparkSessionExtensions  --conf spark.sql.catalog.gsw_catalog=org.apache.iceberg.spark.SparkCatalog  --conf spark.sql.catalog.gsw_catalog.warehouse=\"s3://${data.aws_s3_bucket.s3_assets_bucket.id}/warehouse_path/\"  --conf spark.sql.catalog.gsw_catalog.catalog-impl=org.apache.iceberg.aws.glue.GlueCatalog  --conf spark.sql.catalog.gsw_catalog.io-impl=org.apache.iceberg.aws.s3.S3FileIO"
      }
      description       = "GSW transform job"
      execution_class   = "STANDARD"
      glue_version      = "4.0"
      name              = "gsw_transform"
      number_of_workers = 2
      role_arn          = module.glue_service_iam_role["glue_service_iam_role"].iam_role_arn
      worker_type       = "G.1X"
      command           = [
        {
           name            = "gluestreaming"
           script_location = "s3://${data.aws_s3_bucket.s3_assets_bucket.id}/scripts/gsw_transform.py"
           python_version  = "3"
        },
      ]
    }
  }
  lambda_service_iam_role_props = {
    lambda_service_iam_role = {
      name                         = var.lambda_service_iam_role_name
      description                  = "Lambda service assume role"
      assume_role_policy           = data.template_file.lambda_glue_notebook_service_assume_role.rendered
      path                         = "/"
      tags                         = merge(
        {
          "Name" = format(
            "AWSLambdaATHENAExecutionRole-%s-%s",
            var.name,
            var.environment,
          )
        },
        var.iam_role_tags,
      )
    }
  }
  lambda_service_iam_policy_props = {
    lambda_service_iam_policy = {
      name        = var.lambda_service_iam_policy_name
      description = "Lambda Athena policy Name"
      policy      = data.template_file.lambda_service_policy.rendered
      path        = "/"
      tags        = merge(
        {
           "Name" = format(
             "AWSLambdaServiceExecutionPolicy-%s-%s",
             var.name,
             var.environment,
           )
       },
       var.iam_policy_tags,
      )
    }
  }
  lambda_service_iam_policy_attachment_props = {
    lambda_athena_service_iam_policy_attachment = {
      role       = module.lambda_service_iam_role["lambda_service_iam_role"].iam_role_name
      policy_arn = module.lambda_service_iam_policy["lambda_service_iam_policy"].iam_policy_arn
    },
    glue_service_role_iam_policy_attachment = {
      role       = module.lambda_service_iam_role["lambda_service_iam_role"].iam_role_name
      policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
    },
    glue_service_notebook_role_iam_policy_attachment = {
      role       = module.lambda_service_iam_role["lambda_service_iam_role"].iam_role_name
      policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceNotebookRole"
    }
  }
  gsw_lambda_function_props = {
    gsw_lambda_function = {
      description   = "GSW lambda function"
      function_name = var.gsw_lambda_function_name
      handler       = "create_product_details_table.lambda_handler"
      memory_size   = 128
      publish       = false
      role          = module.lambda_service_iam_role["lambda_service_iam_role"].iam_role_arn
      runtime       = "python3.9"
      s3_bucket     = module.athena_query_result_s3_bucket["athena_query_result_bucket"].s3_bucket_id
      s3_key        = "code/create_product_details_table.py.zip"
      tags                         = merge(
        {
          "Name" = format(
            "gsw_lambda-%s-%s",
            var.name,
            var.environment,
          )
        },
        var.lambda_function_tags,
      )
      timeout       = 600
      environment   = [
        {
          variables = {
            BUCKET        = module.athena_query_result_s3_bucket["athena_query_result_bucket"].s3_bucket_id
            DATABASE_NAME = "gsw_iceberg"
          }
        },
      ]
      ephemeral_storage = [
        {
          size = 512  
        },
      ]     
    }
  }
}
