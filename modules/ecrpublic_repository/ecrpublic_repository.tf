resource "aws_ecrpublic_repository" "ecrpublic_repository" {
  repository_name = var.ecrpublic_repository_repository_name
  tags            = var.ecrpublic_repository_tags
  
  dynamic "catalog_data" {
    for_each = var.ecrpublic_repository_catalog_data
      content {
        about_text        = catalog_data.value["about_text"]
        architectures     = catalog_data.value["architectures"]
        description       = catalog_data.value["description"]
        logo_image_blob   = catalog_data.value["logo_image_blob"]
        operating_systems = catalog_data.value["operating_systems"] 
        usage_text        = catalog_data.value["usage_text"]
      }
  }
}
