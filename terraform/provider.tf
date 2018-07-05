provider "vault" {
  address = "http://${var.vault_leader}:8200"
  token   = "${var.vault_token}"
}

provider "aws" {
  region = "us-east-1"
}

provider "consul" {
  address    = "http://${var.consul_cluster}:8500"
  datacenter = "${var.consul_dc}"
}
