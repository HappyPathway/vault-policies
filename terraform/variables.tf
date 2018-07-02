variable "vault_leader" {}
variable "vault_token" {}

variable "vault_aws_access_key" {
  type = "string"
}

variable "vault_aws_secret_key" {
  type = "string"
}

variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "max_lease_ttl" {
  default = 1500
}

variable "default_lease_ttl" {
  default = 500
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
