resource "aws_macie2_findings_filter" "macie2_findings_filter" {
  action       = var.macie2_findings_filter_action
  description  = var.macie2_findings_filter_description
  name         = var.macie2_findings_filter_name
  name_prefix  = var.macie2_findings_filter_name_prefix
  position     = var.macie2_findings_filter_position
  tags         = var.macie2_findings_filter_tags

  dynamic "finding_criteria" {
    for_each = var.macie2_findings_filter_finding_criteria
      content {
        dynamic "criterion" {
          for_each = finding_criteria.value.criterion
            content {
              eq             = criterion.value["eq"]
              eq_exact_match = criterion.value["eq_exact_match"]
              field          = criterion.value["field"]
              gt             = criterion.value["gt"]
              gte            = criterion.value["gte"]
              lt             = criterion.value["lt"]
              lte            = criterion.value["lte"]
              neq            = criterion.value["neq"]
            }
        }
      }
  }
}
