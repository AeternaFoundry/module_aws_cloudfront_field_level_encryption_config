variable "cloudfront_field_level_encryption_configs" {
  description = <<EOT
Map of cloudfront_field_level_encryption_configs, attributes below
Required:
    - content_type_profile_config (block):
        - content_type_profiles (required, block):
            - items (required, block):
                - content_type (required)
                - format (required)
                - profile_id (optional)
        - forward_when_content_type_is_unknown (required)
    - query_arg_profile_config (block):
        - forward_when_query_arg_profile_is_unknown (required)
        - query_arg_profiles (optional, block):
            - items (optional, block):
                - profile_id (required)
                - query_arg (required)
Optional:
    - comment
EOT

  type = map(object({
    comment = optional(string)
    content_type_profile_config = object({
      content_type_profiles = object({
        items = list(object({
          content_type = string
          format       = string
          profile_id   = optional(string)
        }))
      })
      forward_when_content_type_is_unknown = bool
    })
    query_arg_profile_config = object({
      forward_when_query_arg_profile_is_unknown = bool
      query_arg_profiles = optional(object({
        items = optional(list(object({
          profile_id = string
          query_arg  = string
        })))
      }))
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.cloudfront_field_level_encryption_configs : (
        length(v.content_type_profile_config.content_type_profiles.items) >= 1
      )
    ])
    error_message = "Each items list must contain at least 1 items"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

