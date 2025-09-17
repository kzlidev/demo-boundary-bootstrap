output "global_admin_principal_id" {
  value       = module.boundary.global_admin_principal_id
  description = "Principal ID of Glboal Admin"
}

output "global_scope_id" {
  value = module.boundary.global_scope_id
}

output "org_information" {
  value = module.boundary.org_information
}

output "scope_project_ids" {
  value = module.boundary.project_ids
}