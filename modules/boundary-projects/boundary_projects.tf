variable "boundary_projects" {
  type = list(object({
    name        = string
    description = string
  }))
}

variable "scope_id" {}

resource "boundary_scope" "project" {
  count       = length(var.boundary_projects)
  scope_id    = var.scope_id
  name        = var.boundary_projects[count.index].name
  description = var.boundary_projects[count.index].description
  // name        = "IT_Support"
  // description = "IT Support"
  // scope_id    = boundary_scope.org.id
  // auto_create_admin_role = true
}

output "parent_scope" {
  value = var.scope_id
}

output "project_configs" {
  value = boundary_scope.project[*]
}
