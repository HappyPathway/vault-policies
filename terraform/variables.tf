variable "vault_leader" {}
variable "vault_token" {}

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
