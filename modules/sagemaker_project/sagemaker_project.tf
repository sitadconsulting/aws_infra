resource "aws_sagemaker_project" "sagemaker_project" {
  project_name         = var.sagemaker_project_project_name
  project_description  = var.sagemaker_project_project_description
  tags                 = var.sagemaker_project_tags
  

  dynamic "service_catalog_provisioning_details" {
    for_each = var.sagemaker_project_service_catalog_provisioning_details
      content {
        path_id                  = service_catalog_provisioning_details.value["path_id"]
        product_id               = service_catalog_provisioning_details.value["product_id"]
        provisioning_artifact_id = service_catalog_provisioning_details.value["provisioning_artifact_id"]
        dynamic "provisioning_parameter" {
          for_each = service_catalog_provisioning_details.value.provisioning_parameter
            content {
              key   = provisioning_parameter.value["key"]
              value = provisioning_parameter.value["value"]
            }
        }
      }
  }
}
