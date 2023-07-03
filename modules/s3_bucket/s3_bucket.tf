
#############
# s3 bucket
#############

resource "aws_s3_bucket" "s3_bucket" {
  bucket              = var.s3_bucket_bucket
  bucket_prefix       = var.s3_bucket_bucket_prefix
  force_destroy       = var.s3_bucket_force_destroy
  object_lock_enabled = var.s3_bucket_object_lock_enabled
  tags                = var.s3_bucket_tags


  lifecycle {
    create_before_destroy = true
    ignore_changes        = []
  }
  timeouts {
    create = "30m"
    read   = "30m"
    update = "30m"
    delete = "60m"
  }
}
