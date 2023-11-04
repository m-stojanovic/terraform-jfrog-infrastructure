resource "artifactory_user" "global_user" {
  name              = "jenkins_user"
  email             = "jenkins@devops.com"
  admin             = "true"
  disable_ui_access = "false"
  groups            = ["admin"]
}

resource "artifactory_group" "devops_group" {
  for_each         = local.devops_group
  name             = each.key
  description      = each.value.description
  admin_privileges = each.value.admin
}

resource "artifactory_user" "devops_user" {
  for_each          = local.devops_user
  name              = each.key
  email             = each.value.email
  admin             = each.value.admin
  disable_ui_access = "false"
  groups            = each.value.group
  depends_on        = [artifactory_group.devops_group]
}

resource "artifactory_permission_target" "read_permission" {
  for_each = local.devops_permission
  name     = each.key

  repo {
    repositories = each.value.repo.repositories

    actions {
      groups {
        name        = each.value.actions.groups.name
        permissions = each.value.actions.groups.permissions
      }
    }
  }
}