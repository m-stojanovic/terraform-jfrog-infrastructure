data "aws_secretsmanager_secret_version" "secret_artifactory_access_token" {
  secret_id = local.artifactory_access_token_arn
}