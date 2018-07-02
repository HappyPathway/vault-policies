resource "aws_iam_user" "vault_ec2_user" {
  name = "vault-ec2-${var.vault_ec2_user}"
}

resource "aws_iam_access_key" "vault_ec2_user" {
  user = "${aws_iam_user.vault_ec2_user.name}"

  depends_on = [
    "aws_iam_user.vault_ec2_user",
  ]
}

resource "aws_iam_user_policy" "vault_ec2_user" {
  name = "vault_auth-${var.vault_ec2_user}"
  user = "${aws_iam_user.vault_ec2_user.name}"

  policy = "${file("./iam_roles/vault_ec2_credentials.json")}"

  depends_on = [
    "aws_iam_user.vault_ec2_user",
  ]
}

resource "vault_auth_backend" "aws" {
  type = "aws"

  depends_on = [
    "aws_iam_user.vault_ec2_user",
  ]
}

resource "vault_aws_auth_backend_client" "aws" {
  backend    = "${vault_auth_backend.aws.path}"
  access_key = "${aws_iam_access_key.vault_ec2_user.id}"
  secret_key = "${aws_iam_access_key.vault_ec2_user.secret}"

  depends_on = [
    "vault_auth_backend.aws",
  ]
}

resource "vault_aws_auth_backend_role" "ec2_dev" {
  backend                        = "${vault_auth_backend.aws.path}"
  bound_iam_instance_profile_arn = "arn:aws:iam::753646501470:instance-profile/Darnold-Hashicorp-dev"
  auth_type                      = "iam"
  role                           = "Darnold-Hashicorp-dev"
  policies                       = ["default", "dev"]

  depends_on = [
    "vault_auth_backend.aws",
  ]
}

resource "vault_aws_auth_backend_role" "ec2_production" {
  backend                        = "${vault_auth_backend.aws.path}"
  bound_iam_instance_profile_arn = "arn:aws:iam::753646501470:instance-profile/Darnold-Hashicorp-production"
  auth_type                      = "iam"
  role                           = "Darnold-Hashicorp-production"
  policies                       = ["default", "production"]

  depends_on = [
    "vault_auth_backend.aws",
  ]
}
