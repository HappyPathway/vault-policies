provider "vault" {
  address = "http://${var.vault_leader}:8200"
  token   = "${var.vault_token}"
}

provider "aws" {}
