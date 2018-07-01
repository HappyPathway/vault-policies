resource "vault_auth_backend" "aws" {
  type = "aws"
}

resource "vault_aws_auth_backend_role" "ec2_dev" {
  backend            = "${vault_auth_backend.aws.path}"
  bound_ami_id       = "ami-759bc50a"
  bound_iam_role_arn = "arn:aws:iam::753646501470:instance-profile/Darnold-Hashicorp-dev"
  role_tag           = "Role"
  auth_type          = "ec2"
  role               = "ec2_dev"
  policies           = ["default", "dev"]
}

resource "vault_aws_auth_backend_role" "ec2_production" {
  backend            = "${vault_auth_backend.aws.path}"
  bound_ami_id       = "ami-759bc50a"
  bound_iam_role_arn = "arn:aws:iam::753646501470:instance-profile/Darnold-Hashicorp-production"
  role_tag           = "Role"
  auth_type          = "ec2"
  role               = "ec2_production"
  policies           = ["default", "production"]
}
