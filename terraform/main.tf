resource "vault_aws_secret_backend" "aws" {
  access_key                = "${var.aws_access_key}."
  secret_key                = "${var.aws_secret_key}"
  default_lease_ttl_seconds = "${var.default_lease_ttl}"
  max_lease_ttl_seconds     = "${var.max_lease_ttl}"
}

resource "vault_aws_secret_backend_role" "ec2_admin" {
  backend = "${vault_aws_secret_backend.aws.path}"
  name    = "ec2_admin"
  policy  = "${file("./iam_roles/ec2_admin.json")}"
}

resource "vault_aws_secret_backend_role" "ec2_dev" {
  backend = "${vault_aws_secret_backend.aws.path}"
  name    = "ec2_dev"
  policy  = "${file("./iam_roles/ec2_dev.json")}"
}

resource "vault_policy" "admin" {
  name   = "admin"
  policy = "${file("vault_policies/admin.hcl")}"
}

resource "vault_policy" "ec2_admin" {
  name   = "ec2_admin"
  policy = "${file("vault_policies/ec2_admin.hcl")}"
}

resource "vault_policy" "ec2_dev" {
  name   = "ec2_dev"
  policy = "${file("vault_policies/ec2_dev.hcl")}"
}

resource "vault_policy" "ssh_dev_user" {
  name   = "ssh_dev_user"
  policy = "${file("vault_policies/ssh_dev_user.hcl")}"
}

resource "vault_policy" "ssh_dev_host" {
  name   = "ssh_dev_host"
  policy = "${file("vault_policies/ssh_dev_host.hcl")}"
}

resource "vault_policy" "ssh_production" {
  name   = "ssh_production"
  policy = "${file("vault_policies/ssh_production.hcl")}"
}

resource "vault_policy" "ssh_admin" {
  name   = "ssh_admin"
  policy = "${file("vault_policies/ssh_admin.hcl")}"
}
