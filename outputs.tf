output "cloudfront_field_level_encryption_configs_id" {
  description = "Map of id values across all cloudfront_field_level_encryption_configs, keyed the same as var.cloudfront_field_level_encryption_configs"
  value       = { for k, v in aws_cloudfront_field_level_encryption_config.cloudfront_field_level_encryption_configs : k => v.id if v.id != null && length(v.id) > 0 }
}
output "cloudfront_field_level_encryption_configs_arn" {
  description = "Map of arn values across all cloudfront_field_level_encryption_configs, keyed the same as var.cloudfront_field_level_encryption_configs"
  value       = { for k, v in aws_cloudfront_field_level_encryption_config.cloudfront_field_level_encryption_configs : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "cloudfront_field_level_encryption_configs_caller_reference" {
  description = "Map of caller_reference values across all cloudfront_field_level_encryption_configs, keyed the same as var.cloudfront_field_level_encryption_configs"
  value       = { for k, v in aws_cloudfront_field_level_encryption_config.cloudfront_field_level_encryption_configs : k => v.caller_reference if v.caller_reference != null && length(v.caller_reference) > 0 }
}
output "cloudfront_field_level_encryption_configs_comment" {
  description = "Map of comment values across all cloudfront_field_level_encryption_configs, keyed the same as var.cloudfront_field_level_encryption_configs"
  value       = { for k, v in aws_cloudfront_field_level_encryption_config.cloudfront_field_level_encryption_configs : k => v.comment if v.comment != null && length(v.comment) > 0 }
}
output "cloudfront_field_level_encryption_configs_content_type_profile_config" {
  description = "Map of content_type_profile_config values across all cloudfront_field_level_encryption_configs, keyed the same as var.cloudfront_field_level_encryption_configs"
  value       = { for k, v in aws_cloudfront_field_level_encryption_config.cloudfront_field_level_encryption_configs : k => one(v.content_type_profile_config) if v.content_type_profile_config != null && length(v.content_type_profile_config) > 0 }
}
output "cloudfront_field_level_encryption_configs_etag" {
  description = "Map of etag values across all cloudfront_field_level_encryption_configs, keyed the same as var.cloudfront_field_level_encryption_configs"
  value       = { for k, v in aws_cloudfront_field_level_encryption_config.cloudfront_field_level_encryption_configs : k => v.etag if v.etag != null && length(v.etag) > 0 }
}
output "cloudfront_field_level_encryption_configs_query_arg_profile_config" {
  description = "Map of query_arg_profile_config values across all cloudfront_field_level_encryption_configs, keyed the same as var.cloudfront_field_level_encryption_configs"
  value       = { for k, v in aws_cloudfront_field_level_encryption_config.cloudfront_field_level_encryption_configs : k => one(v.query_arg_profile_config) if v.query_arg_profile_config != null && length(v.query_arg_profile_config) > 0 }
}

