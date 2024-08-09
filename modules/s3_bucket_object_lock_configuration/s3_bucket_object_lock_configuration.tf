resource "aws_s3_bucket_object_lock_configuration" "s3_bucket_object_lock_configuration" {
  bucket                = var.s3_bucket_object_lock_configuration_bucket
  expected_bucket_owner = var.s3_bucket_object_lock_configuration_expected_bucket_owner
  object_lock_enabled   = var.s3_bucket_object_lock_configuration_object_lock_enabled
  token                 = var.s3_bucket_object_lock_configuration_token
  
 dynamic "rule" {
   for_each = var.s3_bucket_object_lock_configuration_rule
     content {
       dynamic "default_retention" {
         for_each = rule.value.default_retention
           content {
             days  = default_retention.value["days"] 
             mode  = default_retention.value["mode"]
             years = default_retention.value["years"]
           }
       }      
     }
 }
}
