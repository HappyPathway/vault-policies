resource "vault_policy" "ec2FullAccess" {
  name   = "admin"
  policy = "${file("vault_policies/ec2_full.hcl")}"
}

resource "vault_policy" "ec2FullAccessRO" {
  name   = "admin_ro"
  policy = "${file("vault_policies/ec2_full_ro.hcl")}"
}
