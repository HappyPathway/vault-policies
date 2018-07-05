provider "vault" {
  address = "http://${var.vault_leader}:8200"
  token   = "${var.vault_token}"
}

provider "aws" {
  region = "us-east-1"
}

provider "consul" {
  address    = "http://${aws_instance.consul.private_ips[0]}:8500"
  datacenter = "${var.consul_dc}"
}
