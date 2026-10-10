resource "aws_cloudfront_field_level_encryption_config" "cloudfront_field_level_encryption_configs" {
  for_each = var.cloudfront_field_level_encryption_configs

  comment = each.value.comment

  content_type_profile_config {
    content_type_profiles {
      dynamic "items" {
        for_each = each.value.content_type_profile_config.content_type_profiles.items
        content {
          content_type = items.value.content_type
          format       = items.value.format
          profile_id   = items.value.profile_id
        }
      }
    }
    forward_when_content_type_is_unknown = each.value.content_type_profile_config.forward_when_content_type_is_unknown
  }

  query_arg_profile_config {
    forward_when_query_arg_profile_is_unknown = each.value.query_arg_profile_config.forward_when_query_arg_profile_is_unknown
    dynamic "query_arg_profiles" {
      for_each = each.value.query_arg_profile_config.query_arg_profiles != null ? [each.value.query_arg_profile_config.query_arg_profiles] : []
      content {
        dynamic "items" {
          for_each = query_arg_profiles.value.items != null ? query_arg_profiles.value.items : []
          content {
            profile_id = items.value.profile_id
            query_arg  = items.value.query_arg
          }
        }
      }
    }
  }
}

