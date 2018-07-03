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

variable "okta_ttl" {
  type        = "string"
  default     = "1h0m0s"
  description = "OKTA Auth TTL"
}

variable "okta_max_ttl" {
  type        = "string"
  default     = "3h0m0s"
  description = "OKTA Auth TTL"
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

variable "organization" {
  type        = "string"
  description = "TFE Organization Name"
}
