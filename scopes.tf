locals {
  scopes = {
    platform = {
      description = "Central Services"
      projects    = [
        {
          name        = "vault"
          description = "Vault for secrets management"
        }
      ]
    },
    applications = {
      description = "Applications"
      projects    = [
        {
          name        = "website"
          description = "Public-facing website"
        },
        {
          name        = "android-app"
          description = "Public-facing Android Application"
        }
      ]
    }
  }
}


resource "boundary_scope" "global" {
  scope_id     = "global"
  name         = "global"
  description  = "Global Scope"
  global_scope = true
}

resource "boundary_scope" "org" {
  for_each    = local.scopes
  scope_id    = boundary_scope.global.id
  name        = each.key               //"demo-org"
  description = each.value.description //"Demo Organization"
}

module "boundary_projects" {
  for_each          = local.scopes
  source            = "./modules/boundary-projects"
  boundary_projects = each.value.projects
  scope_id          = boundary_scope.org[each.key].id
}

#resource "boundary_scope" "project" {
#  for_each    = local.scopes
#  scope_id    = boundary_scope.org[each.key].id
#  name        = each.value.project.name
#  description = each.value.project.description
#  // name        = "IT_Support"
#  // description = "IT Support"
#  // scope_id    = boundary_scope.org.id
#  // auto_create_admin_role = true
#}
