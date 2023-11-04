provider "aws" {
  region     = "eu-west-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

provider "artifactory" {
  url           = "${local.artifactory_url}/artifactory"
  check_license = "false"
  # uncomment for terraform plan on your local machine and insert access_token
  # before commit, remove it.
  # access_token = ""

}
