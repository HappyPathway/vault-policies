resource "aws_iam_user" "vault_iam_user" {
  name = "vault-iam-${var.vault_iam_user}"
}

resource "aws_iam_access_key" "vault_iam_user" {
  user = "${aws_iam_user.vault_iam_user.name}"
}

resource "aws_iam_user_policy" "vault_iam_user" {
  name = "vault_auth-${var.vault_iam_user}"
  user = "${aws_iam_user.vault_iam_user.name}"

  policy = "${file("./iam_roles/vault_iam_credentials.json")}"
}

resource "vault_aws_secret_backend" "aws" {
  access_key                = "${aws_iam_access_key.vault_iam_user.id}"
  secret_key                = "${aws_iam_access_key.vault_iam_user.secret}"
  default_lease_ttl_seconds = "${var.default_lease_ttl}"
  max_lease_ttl_seconds     = "${var.max_lease_ttl}"
}

# IAM Roles that Vault creates when aws backend is read with appropriate Vault Token
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
