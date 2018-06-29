resource "vault_aws_secret_backend" "aws" {
  access_key                = "${var.aws_access_key}."
  secret_key                = "${var.aws_secret_key}"
  default_lease_ttl_seconds = "${var.default_lease_ttl}"
  max_lease_ttl_seconds     = "${var.max_lease_ttl}"
}

module "ec2FullAccess" {
  source      = "./modules/vault_aws_roles"
  policy_file = "./iam_roles/ec2full.json"
  role_name   = "ec2fullAccess"
  backend     = "${vault_aws_secret_backend.aws.path}"
}

module "ec2FullAccessRO" {
  source      = "./modules/vault_aws_roles"
  policy_file = "./iam_roles/ec2full_ro.json"
  role_name   = "ec2fullAccessRO"
  backend     = "${vault_aws_secret_backend.aws.path}"
}
