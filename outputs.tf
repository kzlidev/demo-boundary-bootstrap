output "global_admin_principal_id" {
  value       = boundary_user.ampw_global_admin.id
  description = "Principal ID of Glboal Admin"
}

output "global_scope_id" {
  value = boundary_scope.global.scope_id
}

output "org_information" {
  value = boundary_scope.org[*]
}

output "project_ids" {
  #  value = module.booundary_projects[*]
  value = [for scope in module.boundary_projects : { "${scope.parent_scope}" : scope.project_configs[*].id }]
}