resource "artifactory_local_maven_repository" "maven_repository" {
  for_each                        = toset(local.maven_repository)
  key                             = each.key
  checksum_policy_type            = "client-checksums"
  snapshot_version_behavior       = "unique"
  max_unique_snapshots            = 0
  handle_releases                 = true
  handle_snapshots                = true
  suppress_pom_consistency_checks = false
  project_key                     = var.project_key
}

resource "artifactory_local_rpm_repository" "terraform-local-test-rpm-repo-basic" {
  for_each                   = toset(local.rpm_repository)
  key                        = each.key
  yum_root_depth             = 0
  calculate_yum_metadata     = true
  enable_file_lists_indexing = false
  yum_group_file_names       = "groups.xml"
  project_key                = var.project_key

}

resource "artifactory_local_generic_repository" "terraform-local-test-generic-repo" {
  for_each    = toset(local.generic_repository)
  key         = each.key
  project_key = var.project_key

}

# resource "artifactory_remote_generic_repository" "terraform-remote-generic-repo" {
#   for_each                    = toset(local.remote_repository)
#   key                         = each.key
#   url                         = each.value.url
# }