resource "vault_auth_backend" "aws" {
  type = "aws"
}

resource "vault_aws_auth_backend_role" "ec2_login" {
  backend   = "${vault_auth_backend.aws.path}"
  role_tag  = "vault_role"
  auth_type = "ec2"
}
