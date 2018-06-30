resource "vault_policy" "ec2FullAccess" {
  name   = "admin"
  policy = "${file("vault_policies/ec2_full.hcl")}"
}

resource "vault_policy" "ec2FullAccessRO" {
  name   = "dev"
  policy = "${file("vault_policies/ec2_full_ro.hcl")}"
}

resource "vault_policy" "sshDev" {
  name   = "ssh_dev"
  policy = "${file("vault_policies/ssh_dev.hcl")}"
}

resource "vault_policy" "sshAdmin" {
  name   = "ssh_admin"
  policy = "${file("vault_policies/ssh_admin.hcl")}"
}
