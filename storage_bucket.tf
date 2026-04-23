resource "boundary_storage_bucket" "aws" {
  name        = "${var.friendly_name_prefix}-global-session-recording-storage"
  description = "Storage bucket to store session recording"
  scope_id    = boundary_scope.global.scope_id
  plugin_name = "aws"
  bucket_name = var.session_recording_bucket_name
  attributes_json = jsonencode({
    "region"                      = var.aws_region,
    "disable_credential_rotation" = true,
    # "role_arn"                    = var.session_recording_bucket_role
  })

  # recommended to pass in aws secrets using a file() or using environment variables
  # the secrets below must be generated in aws by creating an aws iam user with programmatic access

  /* secrets_json = jsonencode({
    "access_key_id"     = aws_iam_access_key.boundary.id,
    "secret_access_key" = aws_iam_access_key.boundary.secret
  }) */
  secrets_json = jsonencode({})

  worker_filter = "\"boundary-worker\" in \"/tags/app\""
}
