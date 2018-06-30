resource "vault_aws_secret_backend" "aws" {
  access_key                = "${var.aws_access_key}."
  secret_key                = "${var.aws_secret_key}"
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
