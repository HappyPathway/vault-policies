variable "vault_leader" {}
variable "vault_token" {}

variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "max_lease_ttl" {
  default = 90
}

variable "default_lease_ttl" {
  default = 30
}

variable "okta_org" {
  type = "string"
}

variable "okta_token" {
  type = "string"
}

variable "okta_domain" {
  type    = "string"
  default = "happypathway.com"
}

variable "vault_ec2_user" {
  default = "darnold"
}

variable "vault_iam_user" {
  default = "darnold"
}

variable "region" {
  default = "us-east-1"
}
