resource "aws_connect_user_hierarchy_structure" "connect_user_hierarchy_structure" {
  instance_id = var.connect_user_hierarchy_structure_instance_id

  dynamic "hierarchy_structure" {
    for_each = var.connect_user_hierarchy_structure_hierarchy_structure
      content {
        dynamic "level_one" {
          for_each = hierarchy_structure.value.level_one
            content {
              name = level_one.value["name"]
            }
        }
        dynamic "level_two" {
          for_each = hierarchy_structure.value.level_two
            content {
              name = level_two.value["name"]
            }
        }
        dynamic "level_three" {
          for_each = hierarchy_structure.value.level_three
            content {
              name = level_three.value["name"]
            }
        }
        dynamic "level_four" {
          for_each = hierarchy_structure.value.level_four
            content {
              name = level_four.value["name"]
            }
        }
        dynamic "level_five" {
          for_each = hierarchy_structure.value.level_five
            content {
              name = level_five.value["name"]
            }
        }
      }
  }
}
