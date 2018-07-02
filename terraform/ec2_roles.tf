resource "aws_iam_user" "vault_ec2_user" {
  name = "vault-${var.vault_ec2_user}"
}

resource "aws_iam_access_key" "vault_ec2_user" {
  user = "${aws_iam_user.vault_ec2_user.name}"
}

resource "aws_iam_user_policy" "vault_ec2_user" {
  name = "vault_auth-${var.vault_ec2_user}"
  user = "${aws_iam_user.vault_ec2_user.name}"

  policy = "${file("./iam_roles/vault_ec2_credentials.json")}"
}

resource "vault_auth_backend" "aws" {
  type = "aws"
}

resource "vault_aws_auth_backend_client" "aws" {
  backend    = "${vault_auth_backend.aws.path}"
  access_key = "${aws_iam_access_key.vault_ec2_user.id}"
  secret_key = "${aws_iam_access_key.vault_ec2_user.secret}"
}

resource "vault_aws_auth_backend_role" "ec2_dev" {
  backend            = "${vault_auth_backend.aws.path}"
  bound_ami_id       = "ami-759bc50a"
  bound_iam_role_arn = "arn:aws:iam::753646501470:instance-profile/Darnold-Hashicorp-dev"
  auth_type          = "ec2"
  role               = "ec2_dev"
  policies           = ["default", "dev"]
}

resource "vault_aws_auth_backend_role" "ec2_production" {
  backend            = "${vault_auth_backend.aws.path}"
  bound_ami_id       = "ami-759bc50a"
  bound_iam_role_arn = "arn:aws:iam::753646501470:instance-profile/Darnold-Hashicorp-production"
  auth_type          = "ec2"
  role               = "ec2_production"
  policies           = ["default", "production"]
}
