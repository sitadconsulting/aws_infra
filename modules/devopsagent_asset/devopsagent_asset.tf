resource "aws_devopsagent_asset" "devopsagent_asset" {
  agent_space_id = var.devopsagent_asset_agent_space_id
  asset_type     = var.devopsagent_asset_asset_type
  metadata       = var.devopsagent_asset_metadata

  dynamic "content" {
    for_each = var.devopsagent_asset_content
      content {
        dynamic "file" {
          for_each = content.value.file
            content {
              metadata = file.value["metadata"]
              path     = file.value["path"]
              dynamic "body" {
                for_each = file.value.body
                  content {
                    bytes = body.value["bytes"]
                    text  = body.value["text"]
                  }
              }
            }
        }
        dynamic "source_url" {
          for_each = content.value.source_url
            content {
              url = source_url.value["url"]
            }
        }
        dynamic "zip" {
          for_each = content.value.zip
            content {
              zip_file = zip.value["zip_file"]
            }
        }
      }
  }
}
