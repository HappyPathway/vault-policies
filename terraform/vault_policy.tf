resource "vault_policy" "admin" {
  name   = "admin"
  policy = "${file("vault_policies/admin.hcl")}"
}

resource "vault_policy" "ec2FullAccess" {
  name   = "ec2_admin"
  policy = "${file("vault_policies/ec2_full.hcl")}"
}

resource "vault_policy" "ec2FullAccessRO" {
  name   = "ec2_dev"
  policy = "${file("vault_policies/ec2_full_ro.hcl")}"
}

resource "vault_policy" "sshDev" {
  name   = "ssh_dev"
  policy = "${file("vault_policies/ssh_dev.hcl")}"
}

resource "vault_policy" "sshProduction" {
  name   = "ssh_production"
  policy = "${file("vault_policies/ssh_dev.hcl")}"
}
