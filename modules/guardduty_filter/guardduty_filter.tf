resource "aws_guardduty_filter" "guardduty_filter" {
  action      = var.guardduty_filter_action
  description = var.guardduty_filter_description 
  detector_id = var.guardduty_filter_detector_id
  name        = var.guardduty_filter_name
  rank        = var.guardduty_filter_rank
  tags        = var.guardduty_filter_tags  

  dynamic "finding_criteria" {
    for_each = var.guardduty_filter_finding_criteria
      content {
        equals                = finding_criteria.value["equals"]
        field                 = finding_criteria.value["field"]
        greater_than          = finding_criteria.value["greater_than"]
        greater_than_or_equal = finding_criteria.value["greater_than_or_equal"]
        less_than             = finding_criteria.value["less_than"]
        less_than_or_equal    = finding_criteria.value["less_than_or_equal"]
        matches               = finding_criteria.value["matches"]
        not_equals            = finding_criteria.value["not_equals"]
        not_matches           = finding_criteria.value["not_matches"] 
      }
  }
}
