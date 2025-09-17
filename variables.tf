# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0
variable "friendly_name_prefix" {
  type        = string
  description = "Friendly name prefix used for uniquely naming AWS resources."
  validation {
    condition     = length(var.friendly_name_prefix) > 0 && length(var.friendly_name_prefix) < 17
    error_message = "Friendly name prefix must be between 1 and 16 characters."
  }
}

variable "global_admin_login_name" {
  type        = string
  description = "Global admin login name"
}

variable "global_admin_password" {
  type        = string
  description = "Global admin password"
}