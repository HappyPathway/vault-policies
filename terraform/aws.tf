resource "vault_aws_secret_backend" "aws" {
  access_key                = "${var.aws_access_key}."
  secret_key                = "${var.aws_secret_key}"
  default_lease_ttl_seconds = "${var.default_lease_ttl}"
  max_lease_ttl_seconds     = "${var.max_lease_ttl}"
}

resource "vault_aws_secret_backend_role" "role" {
  backend = "${vault_aws_secret_backend.aws.path}"
  name    = "ec2fullAccess"
  policy  = "${file("./iam_roles/ec2full.json")}"
}

resource "vault_aws_secret_backend_role" "role" {
  backend = "${vault_aws_secret_backend.aws.path}"
  name    = "ec2fullAccessRO"
  policy  = "${file("./iam_roles/ec2full_ro.json")}"
}
