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
  backend = "${vault_auth_backend.aws.path}"

  #bound_iam_role_arn             = "arn:aws:iam::753646501470:role/${var.organization}-dev"
  bound_iam_instance_profile_arn = "arn:aws:iam::753646501470:instance-profile/${var.organization}-dev"
  auth_type                      = "iam"

  # role                           = "${var.organization}-dev"
  policies             = ["default", "dev"]
  inferred_entity_type = "ec2_instance"
  inferred_aws_region  = "us-east-1"

  depends_on = [
    "vault_auth_backend.aws",
  ]
}

resource "vault_aws_auth_backend_role" "ec2_production" {
  backend = "${vault_auth_backend.aws.path}"

  # bound_iam_role_arn             = "arn:aws:iam::753646501470:role/${var.organization}-production"
  bound_iam_instance_profile_arn = "arn:aws:iam::753646501470:instance-profile/${var.organization}-production"

  # auth_type                      = "iam"
  role                 = "${var.organization}-production"
  policies             = ["default", "production"]
  inferred_entity_type = "ec2_instance"
  inferred_aws_region  = "us-east-1"

  depends_on = [
    "vault_auth_backend.aws",
  ]
}
