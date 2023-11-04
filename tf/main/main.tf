locals {
  artifactory_url              = "https://devops.jfrog.io"
  artifactory_access_token_arn = "arn:aws:secretsmanager:eu-west-1:${var.aws_account_id}:secret:prod/jfrog/jfrog_jenkins/access_token-o4uK9A"
  artifactory_access_token = jsonencode(
    data.aws_secretsmanager_secret_version.secret_artifactory_access_token.secret_string
  )

  maven_repository = [
    "devops-lib-snapshots",
    "devops-lib-releases",
    "devops-archetypes-snapshots"
  ]
  rpm_repository = [
    "devops"
  ]
  generic_repository = [
    "Java_and_external_jars",
    "misc"
  ]

  remote_repository = [
    "archiva_snapshots"
  ]

  devops_group = {
    "admin" = {
      description = "Administrator privileges"
      admin       = true
    }
    "read" = {
      description = "Group for ROA"
      admin       = false
    }
    "write" = {
      description = "Group for RWA"
      admin       = false
    }
  }

  devops_user = {
    "user.one" = {
      email = "user.one@devops.com"
      group = ["admin"]
      admin = true
    },
    "user.two" = {
      email = "user.two@devops.com"
      group = ["admin"]
      admin = true
    },
    "user.three" = {
      email = "user.three@devops.com"
      group = ["admin"]
      admin = true
    }
    "jenkins" = {
      email = "jenkins@devops.com"
      group = ["write"]
      admin = false
    }
  }

  devops_permission = {
    "read-permission" = {
      "repo" = {
        repositories = concat(local.maven_repository, local.rpm_repository, local.remote_repository)
      }
      "actions" = {
        "groups" = {
          name        = "read"
          permissions = ["read"]
        }
      }
    }
    "write-permission" = {
      "repo" = {
        repositories = concat(local.maven_repository, local.rpm_repository, local.remote_repository)
      }
      "actions" = {
        "groups" = {
          name        = "write"
          permissions = ["read", "write"]
        }
      }
    }
  }
}
#