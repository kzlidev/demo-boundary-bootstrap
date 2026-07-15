# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    boundary = {
      source  = "hashicorp/boundary"
      version = ">= 1.5.1"
    }
  }
}

provider "boundary" {
  addr             = var.boundary_endpoint
  recovery_kms_hcl = <<EOT
  kms "awskms" {
    purpose    = "recovery"
    region     = "${var.kms_region}"
    kms_key_id = "${var.kms_key_id}"
    key_name   = "recovery"
  }
EOT
}

module "boundary" {
  source                        = "../"
  friendly_name_prefix          = var.friendly_name_prefix
  global_admin_login_name       = var.global_admin_login_name
  global_admin_password         = var.global_admin_password
  aws_region                    = var.aws_region
  session_recording_bucket_name = var.session_recording_bucket_name
  oidc_api_url_prefix           = var.oidc_api_url_prefix
  oidc_auth_name                = var.oidc_auth_name
  oidc_client_id                = var.oidc_client_id
  oidc_client_secret            = var.oidc_client_secret
  oidc_issuer                   = var.oidc_issuer
  oidc_scope_id                 = var.oidc_scope_id
  oidc_signing_algorithms       = var.oidc_signing_algorithms
}
