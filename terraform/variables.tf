variable "vault_leader" {}
variable "vault_token" {}

variable "max_lease_ttl" {
  default = 60
}

variable "default_lease_ttl" {
  default = 30
}

variable "vault_iam_user" {}

variable "organization" {
  type        = "string"
  description = "TFE Organization Name"
}

variable "consul_dc" {
  type        = "string"
  description = "Consul Datacenter. Default: dc1"
  default     = "dc1"
}

variable "consul_cluster" {
  type        = "string"
  description = "IP Address of consul cluster"
}
