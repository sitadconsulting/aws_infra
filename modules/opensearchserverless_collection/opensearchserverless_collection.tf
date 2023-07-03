resource "aws_opensearchserverless_collection" "opensearchserverless_collection" {
  description = var.opensearchserverless_collection_description
  name        = var.opensearchserverless_collection_name
  tags        = var.opensearchserverless_collection_tags
  type        = var.opensearchserverless_collection_type

}
